class Public::LikesController < ApplicationController

  def create
    @like = current_end_user.likes.new(like_params)
    @like.save!
    # binding.pry
    redirect_to post_path(params[:display_name], params[:post_id])
  end

  private

  def like_params
    params.require(:like).permit(:table_id, :table_type)
                          .merge(end_user_id: current_end_user.id)
  end


end
