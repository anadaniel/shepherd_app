class Log < ActiveRecord::Base
  belongs_to :ground_station

  validates :event, presence: true
end
