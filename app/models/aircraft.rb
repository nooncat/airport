class Aircraft < ApplicationRecord
  validates :number, presence: true

  state_machine :state, initial: :in_hangar do
    event :move_to_queue do
      transition in_hangar: :departure_awaiting
    end

    event :take_off do
      transition departure_awaiting: :departed
    end

    event :move_to_hangar do
      transition departed: :in_hangar
    end
  end
end
