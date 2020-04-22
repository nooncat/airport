class Aircraft < ApplicationRecord
  validates :number, presence: true

  state_machine :state, initial: :in_hangar do
    after_transition in_hangar: %i[departure_awaiting takes_off], do: :fill_enqueued_at

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
end
