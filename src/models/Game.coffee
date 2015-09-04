class window.Game extends Backbone.Model
  initialize: (params) ->
    console.log(params.playerHand)
    console.log(params.dealerHand)
    @set('player', params.playerHand)
    @set('dealer', params.dealerHand)
    #setup event listeners
    # this.on('stand') { do shit }
    # this.dealer.on('stand') { do shit }
    # this.on('change') -> this.model.on('change')
    #@params.dealer.on('')
    @get('player').on 'stand', => @standHandler() 
    @get('player').on 'hit', => @hitHandler()
    console.log('init')

  standHandler: (player) ->
    dealer = @get('dealer')
    dealer.at(0).flip()
    while !( dealer.scores()[0] >= 17 or (dealer.scores()[1] >= 17 and dealer.scores()[1] <= 21))
      dealer.hit()
      # 2 2 10 A: 15/26
    @trigger('gameOver')


    console.log('player stand')
    #this is where we handle the game
    #the game logic goes something like this
    #while the dealers value is less than some number
    #the dealer hits
    #fills with magic

  hitHandler: ->
    #player = @get('player')
    player = @get('player')
    if player.scores()[0]>21
      console.log('gameOver')
      @trigger('gameOver')
    # check for busts
    #moar moagic









