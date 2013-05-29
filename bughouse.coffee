@Pieces = new Meteor.Collection "players"

@Board = ->
  @letters = "♖♘♗♔♕♗♘♖♙♙♙♙♙♙♙♙                                ♟♟♟♟♟♟♟♟♜♞♝♚♛♝♞♜"

@Board.prototype.each = (cb) ->
  for ltr, i in @letters
    cb i%8, ~~(i/8), ltr

@Board.prototype.reverse = ->
  @letters = @letters.split("").reverse().join("");
  @
