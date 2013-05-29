Meteor.startup -> reversed false

Template.pieces.pieces = ->
  p = Pieces.find().fetch()
  p.reverse() if reversed()
  p
Template.pieces.rendered = ->
  $(".piece").draggable stop: ->
    console.log "stopping"

Template.piece.computedX = ->
  @row * 51 + 5 + 490 * @boardnum # 0 or 1
Template.piece.computedY = ->
  @col * 52 - 2

Template.controls.events
  "click button": -> reversed !reversed()

# convenience getter/setter for `Session#reversed`
# usage: `reversed()` or `reversed(val)`
reversed = ->
  Session.set "reversed", arguments[0] if arguments.length is 1 # setter
  Session.get "reversed"
