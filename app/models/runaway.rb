class Runaway < ApplicationRecord
  validates :name, presence: true

  has_many :in_queue_aircrafts,
           -> { order(:enqueued_at) },
           class_name: '::Aircraft',
           after_add: :proceed_take_off

  private

  def proceed_take_off(aircraft)
    in_queue_aircrafts.length > 1 ? aircraft.move_to_queue! : aircraft.start_take_off!
  end
end
