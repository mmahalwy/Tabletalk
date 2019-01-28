class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.belongs_to :week, foreign_key: true
      t.belongs_to :timeslot, foreign_key: true

      t.timestamps
    end
  end
end
