# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    # var deck = new Deck()
    # this.set('deck', deck)
    # this.get('deck')
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'game', game = new Game(@attributes)
    game.on 'gameOver', => @findWinner()

  findWinner: ->
    player = @get('playerHand')
    dealer = @get('dealerHand')

    if player.scores()[0] > 21
      console.log('winnner = dealer')
      # call winner is dealer trigger
    else if dealer.scores()[0] > 21
      # call winner is player trigger
      console.log('winner = player')
    else
      maxPlayer = if (player.scores()[1] <= 21) then player.scores()[1] else player.scores()[0]
      maxDealer = if (dealer.scores()[1] <= 21) then dealer.scores()[1] else dealer.scores()[0]
      winner = if maxPlayer>maxDealer then player else dealer
      console.log(winner.scores())
      # maxPlayer = (player.scores()[1] <= 21) ? player.scores()[1] : player.scores()[0]
      # maxPlayer = player.scores()[0] if player.scores()[1] > 21
      #otherwise maxPlayer = player.scores[1])


