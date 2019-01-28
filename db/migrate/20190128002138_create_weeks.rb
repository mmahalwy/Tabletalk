class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
    add_index :weeks, :date_from
    add_index :weeks, :date_to
  end
end
