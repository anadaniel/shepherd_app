class CreateGroundStations < ActiveRecord::Migration
  def change
    create_table :ground_stations do |t|
      t.integer :area_id

      t.timestamps null: false
    end
  end
end
