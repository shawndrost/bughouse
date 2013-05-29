Pieces = new Meteor.Collection "players"

if (Meteor.isClient)
  Template.hello.pieces = -> Pieces.find()

Board = ->
  @letters = "♖♘♗♔♕♗♘♖♙♙♙♙♙♙♙♙                                ♟♟♟♟♟♟♟♟♜♞♝♚♛♝♞♜"

Board.prototype.each = (cb) ->
  for ltr, i in @letters
    cb i%8, ~~(i/8), ltr

Board.prototype.reverse = ->
  @letters = @letters.split("").reverse().join("");
  @

if Meteor.isServer
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
