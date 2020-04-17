class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recruit_players = @user.recruit_players.order("updated_at DESC").page(params[:page]).per(5)
    @relationship = current_user.relationships.new
    @relationship.follow_id = @user.id
  end
  
  def video
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(update_params)
    redirect_to :root and return
  end
  
  private
  def update_params
    params.require(:user).permit(:image, :introduction, :nickname, :video)
  end
end
