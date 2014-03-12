require 'spec_helper'

feature 'Event Creation' do 
	scenario 'creating an event' do
		
		visit new_event_path

		fill_in "event_name", with: "Evento de Prueba"
		fill_in "event_description", with: "a"*101

		fill_in "event_start_at", with: "01/01/2014"
		fill_in "event_end_at", with: "02/01/2014"

		click_button "Save"
		page.should have_content "Evento de Prueba"
	
	end

end