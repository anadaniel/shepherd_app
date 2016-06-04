class AddGrounStationIdToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :ground_station_id, :integer
  end
end
