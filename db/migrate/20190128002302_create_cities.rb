class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name,         default: '', null: false
      t.string :state,        default: '', null: false
      t.string :country,      default: '', null: false
      t.boolean :enabled,     default: false, null: false

      t.timestamps
    end
    add_index :cities, :name
    add_index :cities, :enabled
  end
end
