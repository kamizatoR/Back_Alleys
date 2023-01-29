class Public::HomesController < ApplicationController
  def top
    #@posts = Post.all.page(params[:page]).per(5)
    @posts_arr = []
    Post.all.each do |post|
      @posts_arr << post if post.end_user.is_deleted == false
    end

    @posts = Kaminari.paginate_array(@posts_arr).page(params[:page]).per(3)


  end

end
