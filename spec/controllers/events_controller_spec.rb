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

	  it 'displays' do
	  #testeamos que devuelva lo que nosotros le hemos pedido
	    event = FactoryGirl.create(:event, start_at: Date.today)

	    get :index

	    expect(assigns(:events)).to eq([event])

	    expect(request).to render_template(:index)
	  end

	  #Sin usar doubles,es mas un test de integracion,solo testeamos el 
	  #resultado
	  it 'returns events with STUB that start today' do

		event = double("event")

		  # DA igual que no llame a :start_at_today lo que importa es 
		  # el return
		  Event.stub(:start_at_today).and_return([event])
	
		  # Accion	
		  get :index

		  expect(assigns(:events)).to eq([event])

		  expect(request).to render_template(:index)

	  end


	  # Se llama al metodo :start_at_today realmente,accede a BD
	  it 'returns events with CALL ORIGINAL that start today' do
	  	#Estamos realizando la funcion de un mock que sirve para 
	  	#comprobar que el objeto que estamos comprobando su funcion
	  	#y nos devuelva el metodo al que estamos llamando
		  event = FactoryGirl.create(:event,start_at: Date.today)

		  expect(Event).to receive(:start_at_today).and_call_original

		  # Accion	
		  get :index

		  expect(assigns(:events)).to eq([event])

	  	expect(request).to render_template(:index)

		end

		it 'retuns the create function ' do
			#attrs = FactoryGirl.attributes_for(:events)
			#attrs = y los params
				event_today = {name:"event", 
							 			description: 'a'*101, 
							 			start_at: 1.days.from_now, 
							 			end_at: 2.days.from_now, 
							 			address: "plaza mayor"}
			
				expect { post :create, event: event_today }.to change(Event, :count)
															#event: (y llamamos a)attrs
		#otro ejemplo de porque nos podria interesar ver el controlador
		#expect(response).to redirect_to(assigns(:events))
																	#(event_url)pasamos la url de donque queremos que vaya
		
		#Para ver texto cuando pasa por la zona que queremos ver que esta pasando
		#Rails.logger.debug "texto que queremos ver"
		end

		it 'renders the form when invalid' do
			post :create, event: { name: 'hola'}

			expect(response).to render_template(:new)
		end
	end

end

#class Event
	#def self.start_at_today
	#dice si me han llamado 
	#end
#end
