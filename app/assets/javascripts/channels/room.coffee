App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    alert data['message']

  speak: (user_id, room_id, message) ->
    @perform 'speak', user_id: user_id, room_id: room_id, message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    t = event.target
    App.room.speak(t.getAttribute('data-user-id'), t.getAttribute('data-room-id'), t.value)
    t.value = ''
    event.preventDefault()
