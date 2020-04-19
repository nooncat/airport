class CreateAircrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :aircrafts do |t|
      t.string :number, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
