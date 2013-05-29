Meteor.startup -> reversed false

Template.pieces.pieces = -> Pieces.find()
Template.pieces.rendered = ->
  $(".piece").draggable stop: (e) ->
    Pieces.update({_id: $(this).attr("id")}, {$set: {col: 4}})

Template.piece.computedX = ->
  res = @row * 51 + 5 + 490 * @boardnum # 0 or 1
  res = 857 - res if reversed()
  res
Template.piece.computedY = ->
  res = @col * 52 - 2
  res = 360 - res if reversed()
  res

Template.controls.events
  "click button": -> reversed !reversed()

# convenience getter/setter for `Session#reversed`
# usage: `reversed()` or `reversed(val)`
reversed = ->
  Session.set "reversed", arguments[0] if arguments.length is 1 # setter
  Session.get "reversed"
