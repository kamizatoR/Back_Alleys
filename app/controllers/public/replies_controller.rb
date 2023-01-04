class Public::RepliesController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.new(reply_params)
    @reply.end_user_id = current_end_user.id
    @reply.comment_id = @comment.id
    @reply.save
    redirect_to post_comment_path(@post.id, @comment.id)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.find(params[:id])
    @reply.update(reply_params)
    redirect_to post_comment_reply_path(@post.id, @comment.id, @reply.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to post_comment_path(@post.id, @comment.id)

  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end

end
