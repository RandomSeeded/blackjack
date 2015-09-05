class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<img src=img/<%=parsedName%> >'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    if @model.get('revealed') 
      parsedName = 'cards/'+@model.get('rankName') + '-'+ @model.get('suitName')+'.png'
    else 
      parsedName = 'card-back.png'
    @$el.html @template parsedName:parsedName
    @$el.addClass 'covered' unless @model.get 'revealed'

