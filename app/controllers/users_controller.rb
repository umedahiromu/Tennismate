class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recruit_players = @user.recruit_players.order("updated_at DESC").page(params[:page]).per(5)
    @relationship = current_user.relationships.new
    @relationship.follow_id = @user.id
    
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
    
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
