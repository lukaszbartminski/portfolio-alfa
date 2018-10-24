# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined
set_positions = undefined

set_positions = ->
	$('.col-md-4').each (i) ->
		$(this).attr 'data-pos', i + 1
		return
	return


# Below: line 8 is syntax for creating funcion. At line 9, first '.sortable' is the class name we have declared at index.html.erb(portfolios) at line 3. Second sortable() is function from html.sortable.js file. Line 19 happens when some1 click and drags item on the portfolio.
ready = ->
	set_positions()
	$('.sortable').sortable()
	$('.sortable').sortable().bind 'sortupdate', (e, ui) ->
		updated_order = []
		set_positions()
		$('.col-md-4').each (i) ->
			updated_order.push
				id: $(this).data('id')
				position: i + 1
			return
		$.ajax
			type: 'PUT' #update portfolio
			url: '/portfolios/sort'
			data: order: updated_order
		return
	return

# Below: line 13 simply says, when doc is .ready (load page), call function ready from line 9
$(document).ready ready 
