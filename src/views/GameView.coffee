class window.GameView extends Backbone.View
  
  className: 'game'

  template : _.template('<h2>Winner is: <%= winner %></h2>')
  initialize: ->
    @model.on 'change', => @render()
    @render()

  render: ->
    winner = @model.get('winner')
    console.log(winner)
    return @$el.html @template({winner:winner})
    #return @$el.html @template({'winner':winner})
    #return @$el.html @template 'winner':@model.get('winner')
    # window.alert("game over, winner is #{@get('winner')}")
    # debugger
    # return @$el.text template(@model.attributes)