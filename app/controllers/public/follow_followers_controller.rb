class Public::FollowFollowersController < ApplicationController
  before_action :authenticate_any!

  def create
    @end_user = EndUser.find_by(display_name: params[:display_name])
    follow = current_end_user.follow(@end_user.id)
    follow.save
    redirect_to timeline_path(@end_user.display_name)
  end

  def destroy
    @end_user = EndUser.find_by(display_name: params[:display_name])
    current_end_user.unfollow(@end_user.id)
    redirect_to timeline_path(@end_user.display_name)
  end

  def follows
    @end_user = EndUser.find_by(display_name: params[:display_name])

    @uncancelled_follows = []
    @end_user.followings.each do |follow|
      @uncancelled_follows << follow if follow.is_deleted == false
    end
    
     @follows = Kaminari.paginate_array(@uncancelled_follows).page(params[:page]).per(12)
  end

  def followers
    @end_user = EndUser.find_by(display_name: params[:display_name])

    @uncancelled_followers = []
    @end_user.followers.each do |follower|
      @uncancelled_followers << follower if follower.is_deleted == false
    end
    
    @followers = Kaminari.paginate_array(@uncancelled_followers).page(params[:page]).per(12)
  end

end
