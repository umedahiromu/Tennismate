class PlayersCommentsController < ApplicationController
  def new
    @recruit_player = RecruitPlayer.find(params[:recruit_player_id])
    @comment = PlayersComment.new
    @comment.user_id = current_user.id
    @comment.recruit_player_id = @recruit_player.id
    if @recruit_player.user.id==current_user.id
    @comments = @recruit_player.players_comments.order("updated_at DESC")
    else
    @comments = @recruit_player.players_comments.where(user_id: @recruit_player.user.id).or(@recruit_player.players_comments.where(user_id: current_user.id)).order("updated_at DESC")
    end
    @like = Like.new
  end
  
  def create
    @playerscomment = PlayersComment.create(create_params)
    @recruit_player = @playerscomment.recruit_player
    @recruit_player.create_notification_comment!(current_user, @playerscomment.id)
    redirect_to action: :new
  end
  
  def destroy
    @recruit_player = RecruitPlayer.find(params[:recruit_player_id])
    @comment = @recruit_player.players_comments.find(params[:id])
    @comment.destroy
    redirect_to :root and return
  end
  
  private
  def create_params
    params.require(:players_comment).permit(:text, :user_id, :recruit_player_id)
  end
end
