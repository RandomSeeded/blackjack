# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model

  defaults:
    points:50

  initialize: ->
    @makeGame()

  updatePoints: ->
    console.log('updating points')
    if @get('game').get('winner') == 'player' then @set('points',@get('points')+1) else @set('points',@get('points')-1)
    console.log(@get('points'))

  makeGame: ->
    debugger
    @set 'game', game = new Game(@attributes)
    @get('game').on 'change:winner', => @updatePoints()
