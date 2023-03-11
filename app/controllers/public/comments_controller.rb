class Public::CommentsController < ApplicationController
   before_action :authenticate_any!

  def show
    @comment = Comment.find(params[:id])
    @reply = Reply.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_end_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post.end_user.display_name, @post.id)
    else
      render template: "public/posts/show"
    end

  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.end_user != current_end_user
      redirect_to comment_path(@comment.post.end_user.display_name, @comment.post.id, @comment.id)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path(@comment.post.end_user.display_name, @comment.post.id, @comment.id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post.end_user.display_name, @comment.post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
