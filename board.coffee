@Board = ->
  @letters = "♖♘♗♔♕♗♘♖♙♙♙♙♙♙♙♙                                ♟♟♟♟♟♟♟♟♜♞♝♚♛♝♞♜"

_.extend @Board.prototype,
  each: (cb) ->
    for ltr, i in @letters
      cb i%8, ~~(i/8), ltr
  reverse: ->
    @letters = @letters.split("").reverse().join("");
    @
