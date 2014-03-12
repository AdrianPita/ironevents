require 'spec_helper'

feature 'Event Creation' do 
	scenario 'creating an event' do
		
		visit new_event_path

		fill_in "event_name", with: "Evento de Prueba"
		
	
	end

end