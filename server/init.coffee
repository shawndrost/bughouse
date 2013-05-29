Meteor.startup ->
  board = new Board()
  Pieces.remove({})
  build = (board, firstboard) ->
    board.each (x, y, name) ->
      Pieces.insert {name, x, y, firstboard}
  build board, true
  build board.reverse(), false
