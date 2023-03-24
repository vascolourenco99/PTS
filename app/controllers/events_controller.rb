class EventsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @events = policy_scope(Event)
    @user = current_user
  end

  def show 
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event

    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
  
    redirect_to events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:name, :photo)
  end
  
  
end
