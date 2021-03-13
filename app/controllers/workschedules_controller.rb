class WorkschedulesController < ApplicationController
  # binding.pry
  def index
    if user_signed_in? && current_user.admin?
      @user = current_user
      @ws= Workschedule.all
      respond_to do |format|
        format.html
        format.xlsx do
          # ファイル名をここで指定する（動的にファイル名を変更できる）
          response.headers['Content-Disposition'] = "attachment; filename=#{Date.today}.xlsx"
        end
      end
    end#of if
    if user_signed_in? && current_user
      @user = current_user
      @users = User.all
      @week_days = ["日","月","火","水","木","金","土"]
      @now = Time.current
      @next_month = Time.current.next_month
      @previous_month = Time.current.prev_month
      @workschedules = Workschedule.where(wdate: @now.all_month).where(user_id: current_user.id)
      @workschedules_next_month = Workschedule.where(wdate: @next_month.all_month).where(user_id: current_user.id)
      @workschedules_previous_month = Workschedule.where(wdate: @previous_month.all_month).where(user_id: current_user.id)
      @statuses= Status.all
      #all_month    参考: https://qiita.com/whitefox_105/items/7c1d409ebd863fab5cb5
      #Time.current 参考: https://qiita.com/kodai_0122/items/111457104f83f1fb2259
    end#of if
  end#of def

  def new
    if current_user
      @user = current_user
      @workschedules = Workschedule.where(user_id: current_user.id)
      @workschedule = Workschedule.new
      @statuses= Status.all
    else
      redirect_to root_path and return
    end
  end

  def create
    @user = current_user
    @date = workschedule_params[:wdate]
    # すでに予定投入済みの日に新たに予定をいれる事を防止
    if Workschedule.where(user_id: @user.id).where(wdate: @date).any?
      flash[:danger]= "その日はすでに予定投入済みです"
      redirect_to root_path and return
    end
    if Workschedule.create(workschedule_params)
      flash[:success]= "登録できました"
      redirect_to root_path and return
    else
      flash[:danger]= "登録できませんでした"
      redirect_to '/workschedules/new' and return
    end
  end

  def edit
    @user = current_user
    @statuses= Status.all
    @workschedule = Workschedule.find(params[:id])
    # binding.pry
  end

  def update
    @user = current_user
    @date = workschedule_params[:wdate]
    @workschedule = Workschedule.find(params[:id])
    if @workschedule.update(workschedule_params)
      flash[:success]= "編集できました"
      redirect_to root_path and return
    else
      flash[:danger]= "編集できませんでした"
      redirect_to new_workschedule_path and return
    end
  end

  def destroy
    @workschedule = Workschedule.find(params[:id])
    # binding.pry
    @workschedule.destroy
    redirect_to root_path
  end

  # def excel
  #   @ws= ::Workschedule.all
  #   respond_to do |format|
  #     format.html
  #     format.xlsx{response.headers['Content-Disposition'] = 'attachment; filename="workschedule_lists"'+ Time.zone.now.strftime('%Y%m%d%H%M%S') + '.xlsx'}
  #   end
  # end#of def

  private
      def workschedule_params
        params.require(:workschedule).permit(:wdate, :status_id).merge(user_id: current_user.id)
      end


end#of class
