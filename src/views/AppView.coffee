class window.AppView extends Backbone.View
  className: 'app'
  template: _.template '
    <div class="points">You have <%= points %> points</div>
    <input type="Number" value=<%= betSize %> class="betting-input">
    <button class="hit-button">Hit</button><button class="stand-button">Stand</button>
    <div class="game-view-container"></div>
  '


  events:
    'click .hit-button': -> @hitButtonHandler()
    'click .stand-button': -> 
      @setBetSize()
      @model.get('game').get('playerHand').stand()
    'click .refresh-button': -> 
      @$el.find('.refresh').remove()
      @render()

  setBetSize: ->
    betSize = parseInt($('.betting-input').val()) or 1;
    @model.set('betSize',betSize)    

  hitButtonHandler: ->
    @setBetSize();
    @model.get('game').get('playerHand').hit()

  initialize: ->
    @model.on 'change:points', => @renderEndGame()
    @render()

  renderEndGame: ->
    @render()
    @$el.find('.hit-button').hide()
    @$el.find('.stand-button').hide()
    @$el.find('.betting-input').hide()
    @$el.find('.stand-button').after '<button class="refresh-button">Play again</button>'
    @model.makeGame()

  render: (end) ->
    @$el.children().detach()
      
    @$el.html @template(@model.attributes)
    @$('.game-view-container').html new GameView(model: @model.get 'game').el
    

