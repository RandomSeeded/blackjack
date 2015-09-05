# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model

  defaults:
    points:50
    betSize:1

  initialize: ->
    @makeGame()

  updatePoints: ->
    if @get('game').get('winner') == 'player' then @set('points',@get('points')+@get('betSize')) else @set('points',@get('points')-@get('betSize'))
    console.log(@get('points'))

    # ????
  makeGame: ->
    @set 'game', game = new Game(@attributes)
    @get('game').on 'change:winner', => @updatePoints()
