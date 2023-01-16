class Public::FollowFollowersController < ApplicationController

  def create
    @end_user = EndUser.find_by(display_name: params[:display_name])
    follow = current_end_user.active_relationships.new(follower_id: @end_user.id)
    follow.save
    redirect_to root_path

  end

  def following
    @following = current_end_user.follow_follower.follower_id

    @followers = current_end_user.followings

  end

  def destroy

  end

end
