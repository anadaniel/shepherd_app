class GroundStationSerializer < ActiveModel::Serializer
  attributes :id, :area_id, :lat, :long, :mac_address
end
