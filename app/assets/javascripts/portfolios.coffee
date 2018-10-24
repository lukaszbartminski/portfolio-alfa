# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

# Below: line 8 is syntax for creating funcion. At line 9, first '.sortable' is the class name we have declared at index.html.erb(portfolios) at line 3. Second sortable() is function from html.sortable.js file
ready = ->
	$('.sortable').sortable()	
	return

# Below: line 13 simply says, when doc is .ready, call function ready from line 9
$(document).ready ready 
