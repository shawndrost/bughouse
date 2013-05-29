Meteor.startup ->
  board = new Board()
  Pieces.remove({})
  board.each (row, col, ltr) ->
    Pieces.insert
      name: ltr
      x: row * 51 + 5
      y: col * 52 - 2
  board.reverse().each (row, col, ltr) ->
    Pieces.insert
      name: ltr
      x: row * 51 + 5 + 490
      y: col * 52 - 2
