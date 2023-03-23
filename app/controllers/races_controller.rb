class RacesController < ApplicationController
  before_action :set_event, only: %i[new create edit update destroy]

  def index
    @event = Event.find(params[:event_id])
    @races = @event.races.includes(:photos)
  end

  def show
    @event = Event.find(params[:event_id])
    @race = @event.races.find(params[:id])
    authorize @race
  end

  def new 
    @event = Event.find(params[:event_id])
    @race = Race.new
    authorize @race
  end

  def create 
    @race = Race.new(race_params)
    @race.event = @event
    authorize @race

    if @race.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @race = Race.find(params[:id])
    authorize @race
  end

  def update
    @race = Race.find(params[:id])
    authorize @race

    if@race.update(race_params)
      redirect_to event_path(@race.event)
    else
      render :edit
    end
  end

  def destroy
    @race = Race.find(params[:id])
    authorize @event
    @race.destroy
    
    redirect_to event_path(@race.event), status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def race_params
    params.require(:race).permit(:name, :address, :date, photos: [])
  end
end
