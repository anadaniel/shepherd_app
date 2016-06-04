FactoryGirl.define do
  factory :log do
    event "detected"
    drone_mac_address "34:13:E8:35:30:1D"
    ground_station { FactoryGirl.create :ground_station }
  end
end
