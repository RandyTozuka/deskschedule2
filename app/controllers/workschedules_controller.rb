class WorkschedulesController < ApplicationController
  # binding.pry
  def index
    # @user = current_user
    # @workschedules = Workschedule.where(user_id: current_user.id)
    # @week_days =["日","月","火","水","木","金","土"]
  end

  def new
    # @user = current_user
    # @workschedules = Workschedule.where(user_id: current_user.id)
    # @workschedule = Workschedule.new
    # @statuses= Status.all
  end

  def create
    # @user = current_user
    # @date = workschedule_params[:date]
    # # すでに予定投入済みの日に新たに予定をいれる事を防止
    # if Workschedule.where(user_id: @user.id).where(date: @date).any?
    #   flash[:danger]= "その日はすでに予定投入済みです"
    #   redirect_to root_path and return
    # end
    # if Workschedule.create(workschedule_params)
    #   flash[:success]= "登録できました"
    #   redirect_to root_path and return
    # else
    #   flash[:danger]= "登録できませんでした"
    #   redirect_to '/workschedules/new' and return
    # end
  end

  def edit
    # @user = current_user
    # @statuses= Status.all
    # binding.pry
    # @workschedule = Workschedule.find_by(params[:id])
  end

  def update

  end

  private
      # def workschedule_params
      #   params.require(:workschedule).permit(:date, :status_id).merge(user_id: current_user.id)
      # end

end
