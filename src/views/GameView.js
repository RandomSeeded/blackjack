class window.Game extends Backbone.View
  
  template : _.template('lulz')
  initialize: ->
    @on 'change',@render

  render: ->
    window.alert('game over')