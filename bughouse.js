Pieces = new Meteor.Collection("players");

var white = {
  king    :"&#9812",
  queen   :"&#9813",
  rook    :"&#9814",
  bishop  :"&#9815",
  knight  :"&#9816",
  pawn    :"&#9817"
};

var black = {
  king    :"&#9818",
  queen   :"&#9819",
  rook    :"&#9820",
  bishop  :"&#9821",
  knight  :"&#9822",
  pawn    :"&#9823"
}

if (Meteor.isClient) {
  Template.hello.pieces = function () {
    return Pieces.find();
  };
}

var Board = function(){
  this.letters = "♖♘♗♔♕♗♘♖♙♙♙♙♙♙♙♙                                ♟♟♟♟♟♟♟♟♜♞♝♚♛♝♞♜";
}
Board.prototype.each = function(cb){
  for(var i = 0; i < this.letters.length; i++){
    cb(i%8, ~~(i/8), this.letters[i]);
  }
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    var board = new Board();
    Pieces.remove({});
    board.each(function(row, col, ltr){
      Pieces.insert({
        name: ltr,
        x: row * 51 + 5,
        y: col * 52 - 2
      });
    });
  });
}
