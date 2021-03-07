class WorkschedulesController < ApplicationController
  # binding.pry
  def index
    if current_user
      @user = current_user
      @workschedules = Workschedule.where(user_id: current_user.id).page(params[:page]).per(7)
      @week_days =["日","月","火","水","木","金","土"]
    end
  end

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

  private
      def workschedule_params
        params.require(:workschedule).permit(:wdate, :status_id).merge(user_id: current_user.id)
      end

end
