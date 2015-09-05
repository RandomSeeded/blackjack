class window.AppView extends Backbone.View
  template: _.template '
    <div class="points">You have <%= points %> points</div>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="game-view-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('game').get('playerHand').hit()
    'click .stand-button': -> @model.get('game').get('playerHand').stand()
    'click .refresh-button': -> @render(0)

  initialize: ->
    @model.on 'change:points', => @render(1)
    @render()

  render: (restart) ->
    @$el.children().detach()
      
    @$el.html @template(@model.attributes)
    @$('.game-view-container').html new GameView(model: @model.get 'game').el
    if restart
      @$el.find('.stand-button').after '<button class="refresh-button">Play again</button>'
      @model.makeGame()
    else
      @$el.find('.refresh').remove()

