class LogSerializer < ActiveModel::Serializer
  attributes :id, :event, :drone_mac_address
end
