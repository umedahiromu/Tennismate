class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to user
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user
    end
    user.create_notification_follow!(current_user)
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user
    end
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
