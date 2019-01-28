class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name,             default: '', null: false
      t.string :address,          default: '', null: false
      t.string :google_place_id,  default: ''
      t.json :google_address,     default: '{}'

      t.belongs_to :city, foreign_key: true

      t.timestamps
    end
  end
end
