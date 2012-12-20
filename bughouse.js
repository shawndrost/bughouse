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

if (Meteor.isServer) {
  Meteor.startup(function () {
    Pieces.remove({});
    var names = [
      ["king", 500, 0],
      // ["knight", 50, 0],
      // ["rook", 100, 0]
    ];
    for (var i = 0; i < names.length; i++){
      Pieces.insert({
        name: names[0],
        x: names[1],
        y: names[2],
      });
    }
  });
}
