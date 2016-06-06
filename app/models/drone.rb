class Drone < ActiveRecord::Base
  validates :mac_address, presence: true
  validates :mac_address, uniqueness: true

  belongs_to :controlled_by, class_name: "GroundStation", foreign_key: :controlled_by_id
end
