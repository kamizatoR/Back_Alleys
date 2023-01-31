class Public::LikesController < ApplicationController
   before_action :authenticate_any!

  def create
    @like = current_end_user.likes.find_or_create_by(like_params)
    @like.save
    redirect_to post_likes_path(current_end_user.display_name)
  end

  def destroy
      @like = current_end_user.likes.where(table_id: params[:table_id]).first
      @like.destroy
      redirect_to post_likes_path(current_end_user.display_name)
  end

  def post_likes
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @likes_arr = @end_user.post_like(@end_user.id)
    @likes = Kaminari.paginate_array(@likes_arr).page(params[:page]).per(6)

  end

  def comment_likes
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @likes_arr = @end_user.comment_like(@end_user.id)
    @likes = Kaminari.paginate_array(@likes_arr).page(params[:page]).per(6)
  end

  def reply_likes
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @likes_arr = @end_user.reply_like(@end_user.id)
    @likes = Kaminari.paginate_array(@likes_arr).page(params[:page]).per(6)
  end

  private

  def like_params
    params.require(:like).permit(:table_id, :table_type)
                          .merge(end_user_id: current_end_user.id)
  end
end
