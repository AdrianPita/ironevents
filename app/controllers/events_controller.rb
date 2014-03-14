class EventsController < ApplicationController


  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all #start_at_today
    #Event.start_at_today es el ejercio de los test con los scope 
    respond_to do |format|
      format.html  #index.html.erb
      format.json 
    end
  end
  
  def show
    @event = Event.find params[:id]

    respond_to do |format|
      format.html  #show.html.erb
      format.xml  { render xml: @event}
      format.json { render json: @event}
    end
  end

  def new
    @event = Event.new
    authorize @event 
  end

  def create
    @event = Event.create(create_params)
    #porque hemos establecido que para crear un evento 
    #tenermos que crear un usuario de ahi que haya que generar
    #esto
    @event.user = current_user
    authorize @event

    if @event.save 
      redirect_to @event
    else 
      render :new
    end
  end

  def edit
    @event = Event.find params[:id]
    authorize @event
  end

  def update
    @event = Event.find params[:id]

    if @event.update_attributes 
      flash[:notice] = "Event update successfully"  
      redirect_to event_path(@event.id)
    else 
      flash[:alert] = "The Event is impossible to create"
      render 'edit'
    end
  end

  def destroy
  end

  #Autosearch
  #def search
  #@events = Events.name_controller
  private

  def create_params 
    params.require(:event).permit(:name, :description, :start_at, :end_at, :address)
  end

end
