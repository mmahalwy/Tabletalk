class CreateUserDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_descriptions do |t|
      t.string :type
      t.string :content
      t.integer :type
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :user_descriptions, :type
  end
end
