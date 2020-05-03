class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    following.save
    user.create_notification_follow!(current_user)
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    following.destroy
    redirect_to user_path(user)
  end
  
  def following
    @user = User.find(params[:id])
    @followings = @user.followings
  end
  
  def follower
    @user = User.find(params[:id])
    @followers = @user.followers
  end
  
  private
  def create_params
    params.permit(:follow_id)
  end
end
