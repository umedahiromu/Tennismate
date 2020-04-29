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
    
    speak: function(direct_message) {
      return this.perform('speak', {direct_message: direct_message});
    }
  });
  
  $('#chat-input').on('keypress', function(event) {
    if (event.keyCode === 13) {
      App.room.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
  
  $('#button').on('click', function(){
    var input = $('#chat-input').val();
    App.room.speak(input);
    input = '';
    return input.preventDefault();
  });
  
  
});