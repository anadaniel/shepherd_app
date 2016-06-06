class GroundStation < ActiveRecord::Base
  has_many :logs
  has_one :controlled_drone, class_name: "Drone", foreign_key: :controlled_by_id
end
