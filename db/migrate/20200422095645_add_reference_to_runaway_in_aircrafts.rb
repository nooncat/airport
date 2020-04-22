class AddReferenceToRunawayInAircrafts < ActiveRecord::Migration[5.2]
  def change
    add_reference :aircrafts, :runaway
  end
end
