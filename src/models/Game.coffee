class window.Game extends Backbone.Model

  defaults: 
    winner:"none"
    gameOver:null
    metaData:""

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', playerHand = deck.dealPlayer()
    @set 'dealerHand', dealerHand = deck.dealDealer()
    @get('playerHand').on 'stand', => @standHandler() 
    @get('playerHand').on 'hit', => @hitHandler()

  standHandler: ->
    dealerHand = @get('dealerHand')
    dealerHand.at(0).flip()
    while !( dealerHand.scores()[0] >= 17 or (dealerHand.scores()[1] >= 17 and dealerHand.scores()[1] <= 21))
      dealerHand.hit()
    @findWinner()


  hitHandler: ->
    playerHand = @get('playerHand')
    if playerHand.scores()[0]>21
      @set('winner','dealerHand')
    # check for busts
    #moar moagic

  findWinner: ->
    playerHand = @get('playerHand')
    dealerHand = @get('dealerHand')
    if playerHand.scores()[0] > 21
      @set('winner','dealer')
      # call winner is dealerHand trigger
    else if dealerHand.scores()[0] > 21
      # call winner is playerHand trigger
      @set('winner','player')
    else
      maxPlayer = if (playerHand.scores()[1] <= 21) then playerHand.scores()[1] else playerHand.scores()[0]
      maxDealer = if (dealerHand.scores()[1] <= 21) then dealerHand.scores()[1] else dealerHand.scores()[0]
      @set('winner', if maxPlayer>maxDealer then 'player' else 'dealer')









