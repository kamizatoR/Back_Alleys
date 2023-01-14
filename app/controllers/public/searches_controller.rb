class Public::SearchesController < ApplicationController
  def index

  end

  def result
    @range = params[:range]

    if params[:range] == "ユーザー"
      @search_results = EndUser.looks(params[:word])
    else
      @search_results = Post.looks(params[:word])
    end
  end

end
