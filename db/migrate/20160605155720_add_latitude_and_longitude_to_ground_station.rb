class AddLatitudeAndLongitudeToGroundStation < ActiveRecord::Migration
  def change
    add_column :ground_stations, :lat, :decimal
    add_column :ground_stations, :long, :decimal
  end
end
