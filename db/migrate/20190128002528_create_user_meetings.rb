class CreateUserMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_meetings do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :meeting, foreign_key: true
      t.integer :rating

      t.timestamps
    end
    add_index :user_meetings, :rating
  end
end
