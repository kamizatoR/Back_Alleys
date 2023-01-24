class Public::LikesController < ApplicationController

  def create
    @like = current_end_user.likes.new(like_params)
    @like.save
    redirect_to timeline_path(current_end_user.display_name)
  end

  def index
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @like = @end_user.likes
  end

  def post_likes
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @like = @end_user.post_like
  end

  def comment_likes
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @like = @end_user.comment_like
  end

  def reply_likes
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @like = @end_user.likes
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:table_id, :table_type)
                          .merge(end_user_id: current_end_user.id)
  end
end
