class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  
  def show
  end

  def edit
    @end_user = current_end_user
  end

  def unsubscribe
  end

  def update
    @end_user = current_end_user
    @end_user.update(end_user_params)
    redirect_to mypage_path
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  

  private
    def end_user_params
      params.require(:end_user).permit(:display_name, :first_name, :last_name, :first_kana, :last_kana, :email, :image)
    end
end
