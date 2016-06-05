class LogSerializer < ActiveModel::Serializer
  attributes :id, :event, :drone_id, :drone_mac_address, :ground_station_area_id
end
