class window.Deck extends Backbone.Collection
  model: Card


  initialize: ->
    #call this.add(array), where array is a shuffled deck
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

    #this.pop takes card offf the collection
  dealPlayer: -> new Hand [@pop(), @pop()], @ #this refers to the deck for later reference
    #calling .flip on card model
  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

