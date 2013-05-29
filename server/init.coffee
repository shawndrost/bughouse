Meteor.startup ->
  board = new Board()
  Pieces.remove({})
  build = (board, offset=0) ->
    board.each (row, col, ltr) ->
      Pieces.insert
        name: ltr
        x: row * 51 + 5 + offset
        y: col * 52 - 2
  build board
  build board.reverse(), 490
