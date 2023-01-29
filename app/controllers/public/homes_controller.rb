class Public::HomesController < ApplicationController
  def top
    post_ids = Like.select('table_id, COUNT(*) AS likes_count').where(table_type: 'Post', created_at: (Time.current.beginning_of_day - 7.days)..).group(:table_id).order('likes_count DESC').map(&:table_id)
    #@posts = Post.where(id: post_ids).order(Arel.sql("field(id, #{post_ids.join(',')})"))
    @post_arr = []
    post_ids.each do |id|
      @post_arr << Post.find(id)
    end

    @posts = Kaminari.paginate_array(@post_arr).page(params[:page]).per(6)

  end

  def new_arrival
    @posts_arr = []
    Post.all.each do |post|
      @posts_arr << post if post.end_user.is_deleted == false
    end
    @posts = Kaminari.paginate_array(@posts_arr).page(params[:page]).per(6)

  end

end
