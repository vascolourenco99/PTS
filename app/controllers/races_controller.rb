class RacesController < ApplicationController
  before_action :set_event, only: %i[new create edit update destroy]

  def new 
    @event = Event.find(params[:event_id])
    @race = Race.new
  end

  def create 
    @race = Race.new(race_params)
    @race.event = @event
    if @race.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @race = Race.find(params[:id])
  end

  def update
    @race = Race.find(params[:id])
    @race.update(race_params)

    redirect_to event_path(@race.event)
  end

  def destroy
    @race = Race.find(params[:id])
    @race.destroy
    
    redirect_to event_path(@race.event), status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def race_params
    params.require(:race).permit(:name, :address, :date)
  end
end
