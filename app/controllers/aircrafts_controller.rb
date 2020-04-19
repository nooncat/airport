class AircraftsController < ApplicationController
  def index
    @aircrafts = Aircraft.all
  end
end
