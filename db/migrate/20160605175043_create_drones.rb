class CreateDrones < ActiveRecord::Migration
  def change
    create_table :drones do |t|
      t.string :mac_address

      t.timestamps null: false
    end
  end
end
