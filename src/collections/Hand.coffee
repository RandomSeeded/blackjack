class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) -> 

  hit: ->
    @add(@deck.pop())
    @trigger('hit')
    @last()    

  #trigger stand event from app view invocation
  stand: ->
    @trigger('stand')


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

    # A, 6 = 7/17. Stop
    # A, 2, 10 = 13/23, keep going


