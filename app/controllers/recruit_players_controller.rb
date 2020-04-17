class RecruitPlayersController < ApplicationController
  def new
    @recruit_player = RecruitPlayer.new
  end
  
  def create
    RecruitPlayer.create(create_params)
    redirect_to :root and return
  end
  
  def destroy
    RecruitPlayer.find(params[:id]).destroy
  end
  
  def edit
    @recruit_player = RecruitPlayer.find(params[:id])
  end
  
  def update
    @recruit_player = RecruitPlayer.find(params[:id])
    @recruit_player.update(update_params)
    redirect_to :root and return
  end
  
  def likedmember
    @recruit_player = RecruitPlayer.find(params[:id])
    @likedmembers = @recruit_player.liked_users
  end
  
  private
  def create_params
    params.require(:recruit_player).permit(:place, :number, :start_time, :finish_time, :text).merge(user_id: current_user.id)
  end
  
  def update_params
    params.require(:recruit_player).permit(:place, :number, :start_time, :finish_time, :text)
  end
end
