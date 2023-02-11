class Public::HomesController < ApplicationController
  
  def top
    post_ids = Like.select('table_id, COUNT(*) AS likes_count').where(table_type: 'Post', created_at: (Time.current.beginning_of_day - 7.days)..).group(:table_id).order('likes_count DESC').map(&:table_id)
    #@posts = Post.where(id: post_ids).order(Arel.sql("field(id, #{post_ids.join(',')})")) #←SQLiteでは動作しない？コードらしいです。
    @uncancelled_user_posts = []
    post_ids.each do |id|
      @uncancelled_user_posts << Post.find(id) if Post.find(id).end_user.is_deleted == false
      #binding.pry
    end
    @posts = Kaminari.paginate_array(@uncancelled_user_posts).page(params[:page]).per(6)
  end

  def new_arrival
    @uncancelled_user_posts = []
    Post.all.order(created_at: :desc).each do |post|
      #退会しているユーザーを除く記述
      @uncancelled_user_posts << post if post.end_user.is_deleted == false
    end
    #退会していないユーザーのみ取得
    @posts = Kaminari.paginate_array(@uncancelled_user_posts).page(params[:page]).per(6)
  end

end
