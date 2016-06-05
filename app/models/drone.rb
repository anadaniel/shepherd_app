class Drone < ActiveRecord::Base
  validates :mac_address, presence: true
end
