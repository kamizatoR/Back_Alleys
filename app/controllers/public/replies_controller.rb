class Public::RepliesController < ApplicationController
   before_action :authenticate_any!

  def show
    @reply = Reply.find(params[:id])
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @reply = current_end_user.replies.new(reply_params)
    @reply.comment_id = @comment.id
    if @reply.save
      redirect_to comment_path(@comment.post.end_user.display_name, @comment.post_id, @comment.id)
    else
      render template: "public/comments/show"
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      redirect_to reply_path(@reply.comment.post.end_user.display_name, @reply.comment.post_id, @reply.comment_id, @reply.id)
    else
      render :edit
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to comment_path(@reply.comment.post.end_user.display_name, @reply.comment.post_id, @reply.comment_id)

  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end

end
