class Aircraft::TakeOffWorker < BaseWorker
  def perform(aircraft_id)
    return unless aircraft_id

    aircraft = Aircraft.find(aircraft_id)

    aircraft.departure!
  end
end
