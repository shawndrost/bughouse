reset = ->
  board = new Board()
  Pieces.remove({})
  build = (board, boardnum) ->
    board.each (row, col, name) ->
      Pieces.insert {name, row, col, boardnum}
  build board, 0
  build board.reverse(), 1
Meteor.startup reset