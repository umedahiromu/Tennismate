class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    #present?の戻り値は真偽値。よって、trueの場合、
    if Entry.where("user_id=? AND room_id=?",current_user.id, @room.id).present?
      @direct_messages = @room.direct_messages
      @entry = @room.entries.where.not(user_id: current_user.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def create
    @room = Room.create(:name => "DM")
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to room_path(@room.id)
  end
end
