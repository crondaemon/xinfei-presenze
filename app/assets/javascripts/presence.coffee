# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

toggleUser = (data) ->
	user_id = data
	$('#user-' + user_id + '-present').toggle()

printError = (data) ->
	message = data['responseText']
	alert("Errore: " + message)

$(document).on "turbolinks:load", ->
	$('.click-presence').on 'click', (e) ->
		user_id = $(this).data('user')
		day = $(this).data('day')
		$.ajax({
			url: '/presence/mark'
			data: { user_id: user_id, day: day }
			success: (data) ->
				toggleUser(data)
			error: (data) ->
				printError(data)
		})

	$('.datetimepicker').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true,
		language: 'it'
		})

	$('#date-change').on 'click', (e) ->
		$('#date-change-form').fadeToggle()