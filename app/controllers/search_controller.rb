class SearchController < ApplicationController
	
	def autocomplete 
    if params[:term]
    	@events = Event.where('name LIKE ?', "#{params[:term]}%")
  	else
    	@events = Event.all
  	end
		render json: @events.map(&:name)
		#@events.map do |event|
			#event.name
		#end
  end
end
