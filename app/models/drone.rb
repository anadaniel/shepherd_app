class Drone < ActiveRecord::Base
  validates :mac_address, presence: true
  validates :mac_address, uniqueness: true
end
