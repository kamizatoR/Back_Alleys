class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def result
    @range = params[:range]

    if params[:range] == "ユーザー"
      @search_end_users = EndUser.looks(params[:word])

      @uncancelled_user_search_result = []
      @search_end_users.each do |search_end_user|
        #退会しているユーザーを除く記述
        @uncancelled_user_search_result << search_end_user if search_end_user.is_deleted == false
      end
      #退会していないユーザーのみ取得
      @search_results= Kaminari.paginate_array(@uncancelled_user_search_result).page(params[:page]).per(12)

    else
      @search_posts = Post.looks(params[:word])

      @uncancelled_user_search_result = []
      @search_posts.each do |search_post|
        #退会しているユーザーを除く記述
        @uncancelled_user_search_result << search_post if search_post.end_user.is_deleted == false
      end

      @search_results= Kaminari.paginate_array(@uncancelled_user_search_result).page(params[:page]).per(12)
    end
  end
end
