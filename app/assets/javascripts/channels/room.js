document.addEventListener('turbolinks:load', function() {
  App.room = App.cable.subscriptions.create({
    channel: "RoomChannel",
    room: $('#direct_messages').data('room_id')
  }, {
    connected: function() {
      
    },
    
    disconnected: function() {
      
    },
    
    received: function(data) {
      document.getElementById('direct_messages').innerHTML += data['direct_message'];
    },
    
    speak: function(direct_message, userid) {
      return this.perform('speak', {direct_message: direct_message, userid: userid});
    }
  });
  
  $('#button').on('click', function(){
    var input = $('#chat-input').val();
    var userid = $('#chat-input').data("userid");
    App.room.speak(input, userid);
    input = '';
    return input.preventDefault();
  });
  
  
});