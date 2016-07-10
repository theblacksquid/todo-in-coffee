

class Item extends Backbone.Model
	defaults: 
		title: ""
		completed: false

class List extends Backbone.Collection
	model: Item
	
template = (input) ->
 "<li>#{input}</li>"

class window.ListView extends Backbone.View
	el: $ 'body'
	
	events: 
		"click button": "appendItem"
	
	initialize: ->
		@list = new List
		@render()
		
	render: ->
		$(@el).html "<div id='app'></div>"
		$("#app").append "<button>Add Item</button>"
		$("#app").append "<input type='text' />"
		$('#app').append "<ul id='list'></ul>"
		@
	
	appendItem: ->
		console.log "button pressed"
		item = new Item
		input = $('input').val()
		item.set("title",input)
		@list.add item
		$("#list").append template(input)
		console.log item.get('title')
		


list_view = new ListView
