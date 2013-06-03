Meteor.startup -> reversed false

Template.pieces =
  pieces: -> Pieces.find()
  rendered: ->
    $(".piece").draggable stop: (e) ->
      row = ~~((e.clientX % 480) / 50)
      col = ~~(e.clientY / 50)
      [row, col] = [7-row, 7-col] if reversed()
      _id = $(this).attr("id")
      Pieces.update({_id}, {$set: {row, col}})

Template.piece =
  computedX: ->
    res = @row * 50 + 5 + 480 * @boardnum # 0 or 1
    res = 840 - res if reversed()
    res
  computedY: ->
    res = @col * 50 - 5
    res = 340 - res if reversed()
    res

Template.controls.events
  "click button": -> reversed !reversed()

# convenience getter/setter for `Session#reversed`
# usage: `reversed()` or `reversed(val)`
reversed = ->
  Session.set "reversed", arguments[0] if arguments.length is 1 # setter
  Session.get "reversed"
