class AddMacAddressToGroundStation < ActiveRecord::Migration
  def change
    add_column :ground_stations, :mac_address, :string
  end
end
