class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    #@suspended_end_users = EndUser.where(is_deleted: "true")
    @suspended_end_users = EndUser.all
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
