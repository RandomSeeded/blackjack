class window.AppView extends Backbone.View
  template: _.template '
    <div class="points">You have <%= points %> points</div>
    <input type="Number" class="betting-input" placeholder="place your bet">
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="game-view-container"></div>
  '

  events:
    'click .hit-button': -> @hitButtonHandler()
    # @model.get('game').get('playerHand').hit()
      # make this a function which does two things
      # 1) the hit
      # 2) hey model, change / store your points
    'click .stand-button': -> 
      @setBetSize()
      @model.get('game').get('playerHand').stand()
    'click .refresh-button': -> @render(0)

  setBetSize: ->
    betSize = parseInt($('.betting-input').val()) or 1;
    @model.set('betSize',betSize)    

  hitButtonHandler: ->
    @setBetSize();
    @model.get('game').get('playerHand').hit()

  initialize: ->
    @model.on 'change:points', => @render(1)
    @render()

  render: (end) ->
    @$el.children().detach()
      
    @$el.html @template(@model.attributes)
    @$('.game-view-container').html new GameView(model: @model.get 'game').el
    if end
      @$el.find('.stand-button').after '<button class="refresh-button">Play again</button>'
      @model.makeGame()
      @$el.find('.hit-button').hide()
      @$el.find('.stand-button').hide()
      @$el.find('.betting-input').hide()
    else
      @$el.find('.hit-button').show()
      @$el.find('.stand-button').show()
      @$el.find('.betting-input').val(@model.get('betSize'))
      @$el.find('.betting-input').show()
      @$el.find('.refresh').remove()

