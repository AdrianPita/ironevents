require 'spec_helper'

describe EventsController do
#queremos comprobar que hace algo, el comportamiento, por eso se altera el orden
#de ahi que expect vaya por delante, es como que hace una llamada
#diciendo ehhh que te ellamado
	describe '#index' do
		#testeamos lo que sucede en el interface
	  it 'displays events for today' do
	  	event = double("event")
	  	#en el contador lo que hacemos es llamar al metodo for today y que nos devuelva el evento
		#comprobamos que se llama al metodo at today
		expect(Event).to receive(:start_at_today).and_return([event])

  		#vamos a probar que el events de index (events_controller) 
		get :index
		
		#comprobamos que se realiza la asignacion a la variable event
		#he metido esos eventos
		expect(assigns(:events)).to eq([event])
		#@event no existe dentro del test controlador,
		#solo dentro del EventsController 
		#assigns solo espera la instancia sea igual al event

	  end

	  it 'displays'
	  #testeamos que devuelva lo que nosotros le hemos pedido
	    event = FactoryGirl.create(:event, start_at: Time.now)

	    get :index

	    expect(assigns(:events)).to eq([event])

	    expect(request).to render_template(:index)
	  end

	  it ''
	end

end

#class Event
	#def self.start_at_today
	#dice si me han llamado 
	#end
#end
