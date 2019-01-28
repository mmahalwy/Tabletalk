class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.belongs_to :timeslot, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
