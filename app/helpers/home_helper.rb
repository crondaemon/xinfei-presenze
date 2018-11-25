module HomeHelper
	def home_buttons
		link_to('Segna', presences_day_path, class: home_button_classes) +
		link_to('Scegli giorno', presences_select_path, class: home_button_classes) +
		link_to('Mostra', presences_show_path, class: home_button_classes) +
		link_to('Statistiche', presences_stats_path, class: home_button_classes)
	end

	def home_button_classes
		@classes ||= 'btn btn-lg btn-primary'
	end
end
