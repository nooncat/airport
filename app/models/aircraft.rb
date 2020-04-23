class Aircraft < ApplicationRecord
  belongs_to :runaway, optional: true

  validates :number, presence: true

  state_machine :state, initial: :in_hangar do
    before_transition in_hangar: %i[departure_awaiting takes_off], do: :fill_enqueued_at

    after_transition %i[in_hangar departure_awaiting] => :takes_off, do: :start_processing_take_off

    after_transition takes_off: :departed, do: %i[remove_from_take_off_queue proceed_to_next_aircraft]

    event :move_to_queue do
      transition in_hangar: :departure_awaiting
    end

    event :start_take_off do
      transition %i[in_hangar departure_awaiting] => :takes_off
    end

    event :departure do
      transition takes_off: :departed
    end

    event :move_to_hangar do
      transition departed: :in_hangar
    end
  end

  private

  def fill_enqueued_at
    update(enqueued_at: Time.current)
  end

  def start_processing_take_off
    Aircraft::TakeOffWorker.perform_in(rand(11..15).seconds, id)
  end

  def remove_from_take_off_queue
    runaway.in_queue_aircrafts.delete(self)
  end

  def proceed_to_next_aircraft
    next_aircraft = runaway.in_queue_aircrafts.first

    return unless next_aircraft

    next_aircraft.start_take_off!
  end
end
