class Public::CommentsController < ApplicationController
  def show
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.end_user_id = current_end_user.id
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
