class window.GameView extends Backbone.View
  
  className: 'game'

  template : _.template('<h2>Winner is: <%= winner %></h2>
                        <div class="player-hand-container"></div>
                        <div class="dealer-hand-container">
                        <div class="game-view-container"></div>')
  initialize: ->
    @model.on 'change', => @render()
    @render()

  render: ->
    winner = @model.get('winner')
    @$el.html @template({winner:winner})
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el    
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    