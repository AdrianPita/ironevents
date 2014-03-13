class ApplicationController < ActionController::Base
  include Pundit
  #action hereda de aplication debido al "<"
  #cundo queremos agregar mas funcionalidad se puede hacer por la manera tradicionale def...
  #cuando se hace un include todos los metodos de pundit, me los vas a crear a mi
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.  
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  rescue_from ActiveRecord::RecordNotFound, with: :event_not_find

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  	#lo redirige a donde el hizo la request  o al camino de la raiz
  end

  def event_not_find
 
  	 render :text => 'You are passed out, this event is cancelled.', :status => '404'
  end

end
