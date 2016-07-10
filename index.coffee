

class Item extends Backbone.Model
	defaults: 
		title: ""
		completed: false
		cid: @.cid

class List extends Backbone.Collection
	model: Item
	
template = (input) ->
 "<li> #{input} <button class='delete'>X</button>
 </li>
 "

class window.ListView extends Backbone.View
	el: $ 'body'
	
	events: 
		"click .add": "appendItem"
		"click .delete": "removeItem"
	
	initialize: ->
		@list = new List
		@render()
		
	render: ->
		$(@el).html "<div id='app'></div>"
		$("#app").append "<button class='add'>Add Item</button>"
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
	
	removeItem: -> #currently does not work. does't remove model
		@list.remove @list.at(@list.length - 1)
		console.log "Item Removed"

list_view = new ListView
