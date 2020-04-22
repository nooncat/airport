class AircraftsController < ApplicationController
  def index
    @aircrafts = Aircraft.all
    @in_queue_aircrafts = Runaway.first.in_queue_aircrafts
  end

  def take_off
    aircraft = Aircraft.find(params[:id])

    Runaway.first.in_queue_aircrafts << aircraft

    redirect_to root_path, flash: { success: t('.take_off_initialized') }
  end
end
