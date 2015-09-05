# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    # var deck = new Deck()
    # this.set('deck', deck)
    # this.get('deck')
    @set 'playerHand', player = deck.dealPlayer()
    @set 'dealerHand', dealer = deck.dealDealer()
    @set 'game', game = new Game(@attributes)
    # game.on 'gameOver', => @findWinner(player,dealer)

  
      # maxPlayer = (player.scores()[1] <= 21) ? player.scores()[1] : player.scores()[0]
      # maxPlayer = player.scores()[0] if player.scores()[1] > 21
      #otherwise maxPlayer = player.scores[1])


