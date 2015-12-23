App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    $("#messages").append "<div>hi newer</div>"
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#messages").append data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (msg) ->
    @perform 'speak', message: msg

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
