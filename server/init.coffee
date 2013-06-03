reset = ->
  new Board(0).save()
  new Board(1).reverse().save()
Meteor.startup reset