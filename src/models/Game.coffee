class window.Game extends Backbone.Model

  defaults: 
    winner:"none"
    gameOver:null
    metaData:""

  initialize: (params) ->
    console.log(params.playerHand)
    console.log(params.dealerHand)
    @set('player', params.playerHand)
    @set('dealer', params.dealerHand)
    @get('player').on 'stand', => @standHandler() 
    @get('player').on 'hit', => @hitHandler()

  standHandler: (player) ->
    dealer = @get('dealer')
    dealer.at(0).flip()
    while !( dealer.scores()[0] >= 17 or (dealer.scores()[1] >= 17 and dealer.scores()[1] <= 21))
      dealer.hit()
      # 2 2 10 A: 15/26
    @findWinner()

    #this is where we handle the game
    #the game logic goes something like this
    #while the dealers value is less than some number
    #the dealer hits
    #fills with magic

  hitHandler: ->
    #player = @get('player')
    player = @get('player')
    if player.scores()[0]>21
      @findWinner()
    # check for busts
    #moar moagic

  findWinner: ->
    player = @get('player')
    dealer = @get('dealer')
    if player.scores()[0] > 21
      @set('winner','dealer')
      # call winner is dealer trigger
    else if dealer.scores()[0] > 21
      # call winner is player trigger
      @set('winner','player')
    else
      maxPlayer = if (player.scores()[1] <= 21) then player.scores()[1] else player.scores()[0]
      maxDealer = if (dealer.scores()[1] <= 21) then dealer.scores()[1] else dealer.scores()[0]
      @set('winner', if maxPlayer>maxDealer then 'player' else 'dealer')









