Meteor.startup -> reversed false

Template.pieces.pieces = ->
  p = Pieces.find().fetch()
  p.reverse() if reversed()
  p
Template.pieces.rendered = -> $(".piece").draggable()

Template.piece.computedX = ->
  val = 0
  val += 490 if @firstboard
  val += @x * 51 + 5
Template.piece.computedY = ->
  @y * 52 - 2

Template.controls.events
  "click button": -> reversed !reversed()

# convenience getter/setter for `Session#reversed`
# usage: `reversed()` or `reversed(val)`
reversed = ->
  Session.set "reversed", arguments[0] if arguments.length is 1 # setter
  Session.get "reversed"
