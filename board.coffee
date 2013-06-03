@Board = (@boardnum) ->
  @chars = "♖♘♗♔♕♗♘♖♙♙♙♙♙♙♙♙                                ♟♟♟♟♟♟♟♟♜♞♝♚♛♝♞♜"
_.extend @Board.prototype,
  each: (cb) ->
    for char, i in @chars
      cb i%8, ~~(i/8), char
  reverse: ->
    @chars = @chars.split("").reverse().join("");
    @
  save: () ->
    Pieces.remove {@boardnum}
    Clocks.remove {@boardnum}
    Clocks.insert {@boardnum, playernum: 0}
    Clocks.insert {@boardnum, playernum: 1}
    @each (row, col, char) =>
      obj = {row, col, char, boardnum: @boardnum}
      Pieces.insert obj
