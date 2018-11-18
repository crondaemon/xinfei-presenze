# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

updateCounter = (data) ->
	counter = $('#counter')
	i = parseInt(counter.text(), 10)
	increment = data['increment']
	counter.text(i + increment)

printError = (data) ->
	console.log(data)
	message = data['responseJSON']['message']
	alert("Errore: " + message)
	location.reload()

$(document).on "turbolinks:load", ->
	$('.click-presence').on 'click', (e) ->
		user_id = $(this).data('user')
		day = $(this).data('day')
		$('#user-' + user_id + '-present').toggle()
		$.ajax({
			url: '/presence/mark'
			data: { user_id: user_id, day: day }
			success: (data) ->
				updateCounter(data)
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