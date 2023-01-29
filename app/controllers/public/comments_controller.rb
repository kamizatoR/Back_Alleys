class Public::CommentsController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @reply = Reply.new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.end_user_id = current_end_user.id
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post.end_user.display_name, @post.id)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to comment_path(@post.end_user.display_name, @post.id, @comment.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post.end_user.display_name, @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
