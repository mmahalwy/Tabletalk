class CreateTimeslots < ActiveRecord::Migration[5.2]
  def change
    create_table :timeslots do |t|
      t.string :day_of_week
      t.string :time_of_day
      t.boolean :enabled, default: false, null: false

      t.timestamps
    end
    add_index :timeslots, :day_of_week
    add_index :timeslots, :time_of_day
    add_index :timeslots, :enabled
  end
end
