Meteor.startup ->
  board = new Board()
  Pieces.remove({})
  build = (board, firstboard) ->
    board.each (row, col, name) ->
      Pieces.insert {name, row, col, firstboard}
  build board, true
  build board.reverse(), false
