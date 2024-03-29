class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    DirectMessage.create! message: data['direct_message'], user_id: current_user.id, room_id: params['room']
    Notification.create!(visitor_id: current_user.id, visited_id: data['userid'], room_id: params['room'], action: 'message')
  end
end