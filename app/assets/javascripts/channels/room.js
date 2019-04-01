App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function () {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function () {
    // Called when the subscription has been terminated by the server
  },

  received: function (data) {
    return $('#chat-index').append('<li>' + data['message'] + '<li>');
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});
