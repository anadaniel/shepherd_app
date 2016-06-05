class Api::V1::GroundStationsController < ApplicationController
  def index
    ground_stations = GroundStation.all
    render json: ground_stations, status: :ok
  end
end
