class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @events = @user.events
    @races = @user.events.map(&:races).flatten
  end
end
