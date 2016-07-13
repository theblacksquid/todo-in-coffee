

class Item extends Backbone.Model
	defaults: 
		title: ""
		completed: false
		id: null

class List extends Backbone.Collection
	model: Item
	
template = (input) ->
 "<li> #{input} <button class='delete'>X</button>
 </li>
 "

class window.ItemView extends Backbone.View # WIP, do no use
  
  initialize: ->
    @model = new Item
    
  events: 
    "click .delete": "removeItem"
  
  render: ->
    input = @model.get 'title'
    $(@el).append template(input)
    @
  
  removeItem: ->
    @model.destroy()
    @.remove()
    console.log "item removed"

class window.ListView extends Backbone.View
  el: $ 'body'
  
  events: 
    "click .add": "appendItem"
    "keydown" : "keyPress"
  
  initialize: ->
    @list = new List
    @render()
  
  render: ->
    $(@el).html "<div id='app'></div>"
    $("#app").append "<input type='text' /><br />"
    $("#app").append "<button class='add'>Add Item</button>"
    $('#app').append "<ul id='list'></ul>"
    @
  
  appendItem: ->
    console.log "button pressed"
    input = $('input').val()
    item = new ItemView({el: "#list"})
    item.model.set({title: input})
    @list.add item.model
    item.render()
  
  keyPress: (e) ->
    if e.which is 13   # 13 is the Enter key
      @appendItem()

list_view = new ListView
