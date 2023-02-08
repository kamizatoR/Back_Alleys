class Public::EndUsersController < ApplicationController
   before_action :authenticate_any!

  def timeline
   @end_user = EndUser.find_by(display_name: params[:display_name])
   @end_uesr_post_arr = @end_user.posts.order(created_at: :desc)
   @end_user_posts = Kaminari.paginate_array(@end_uesr_post_arr).page(params[:page]).per(6)
  end

  def mypage
    @end_uesr = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def unsubscribe
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def comments_list
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @end_uesr_comment_arr = @end_user.comments.order(created_at: :desc)
    @end_user_comments = Kaminari.paginate_array(@end_uesr_comment_arr).page(params[:page]).per(6)
  end

  def replies_list
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @end_uesr_reply_arr = @end_user.replies.order(created_at: :desc)
    @end_user_replies = Kaminari.paginate_array(@end_uesr_reply_arr).page(params[:page]).per(6)
  end

  private
    def end_user_params
      params.require(:end_user).permit(:display_name, :first_name, :last_name, :first_kana, :last_kana, :email, :image)
    end
end
