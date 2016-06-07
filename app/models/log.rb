class Log < ActiveRecord::Base
  belongs_to :ground_station
  belongs_to :drone

  validates :event, presence: true

  after_create :get_drone_from_mac_address, if: Proc.new { self.drone_mac_address.present? }
  after_create :set_drone_controlled_by, if: Proc.new { self.event == EVENTS[:taking_control] }
  after_create :publish_to_redis

  EVENTS = {
    detected: 'detected',
    new_detected: 'new_detected',
    taking_control: 'taking_control'
  }

  def ground_station_area_id
    self.ground_station.area_id
  end

  def get_drone_from_mac_address
    drone = Drone.find_or_initialize_by mac_address: self.drone_mac_address

    if drone.new_record?
      self.event = EVENTS[:new_detected]
      drone.save
    end

    self.drone = drone
    self.save
  end

  def set_drone_controlled_by
    drone = self.drone
    drone.update({ controlled_by_id: self.ground_station_id })
  end

  def publish_to_redis
    $redis.publish 'logs.create', self.attributes.to_json
  end
end
