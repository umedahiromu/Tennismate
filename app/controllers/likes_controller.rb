class LikesController < ApplicationController
  def create
    @like = current_user.likes.create("recruit_player_id=?", params[:recruit_player_id])
    @recruit_player = RecruitPlayer.find(params[:recruit_player_id])
    @recruit_player.create_notification_like!(current_user)
  end
  
  def destroy
    @like = Like.find_by("recruit_player_id=? AND user_id=?", params[:recruit_player_id], current_user.id)
    @like.destroy
    @recruit_player = RecruitPlayer.find(params[:recruit_player_id])
  end
end
