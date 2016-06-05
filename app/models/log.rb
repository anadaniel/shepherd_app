class Log < ActiveRecord::Base
  belongs_to :ground_station
  belongs_to :drone

  validates :event, presence: true

  def ground_station_area_id
    self.ground_station.area_id
  end
end
