class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    #@suspended_end_users = EndUser.where(is_deleted: "true")
    @suspended_end_user_arr = []
    EndUser.all.each do |end_user|
      #退会しているユーザーを除く記述
      @suspended_end_user_arr << end_user if end_user.is_deleted == true
    end

    @suspended_end_users= Kaminari.paginate_array(@suspended_end_user_arr).page(params[:page]).per(10)
  end

  def show
    @end_user =  EndUser.find(params[:id])
  end

  def account_suspension
    @end_user =  EndUser.find(params[:id])
  end

  def suspended
    @end_user = EndUser.find(params[:id])
    @end_user.update(is_deleted: true)
    redirect_to root_path
  end

end
