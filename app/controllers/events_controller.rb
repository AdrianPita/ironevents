class EventsController < ApplicationController
  def index
    @events = Event.start_at_today  
  end
  
  def show
    @event = Event.find params[:id]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(create_params)
    
    if @event.save 
      redirect_to @event
    else 
      render :new
    end
  end

  def edit
    @event = Event.find params[:id]
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

  private

  def create_params 
    params.require(:event).permit(:name, :description, :start_at, :end_at, :address)
  end

end
