class Public::FollowFollowersController < ApplicationController

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
    @end_user_follows = @end_user.followings
  end

  def followers
    @end_user = EndUser.find_by(display_name: params[:display_name])
    @end_user_followers = @end_user.followers
  end

end
