module HomeHelper
	def home_buttons
		link_to('Segna', presence_day_path, class: home_button_classes) +
		link_to('Scegli giorno', presence_select_path, class: home_button_classes) +
		link_to('Mostra', presence_show_path, class: home_button_classes) +
		link_to('Statistiche', presence_stats_path, class: home_button_classes)
	end

	def home_button_classes
		@classes ||= 'btn btn-lg btn-primary'
	end
end
