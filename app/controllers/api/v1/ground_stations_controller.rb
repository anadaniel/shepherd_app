class Api::V1::GroundStationsController < ApplicationController
  def index
    ground_stations = GroundStation.all
    render json: ground_stations, status: :ok
  end

  def create
    ground_station = GroundStation.new ground_station_params
    if ground_station.save
      render json: ground_station, status: :created
    else
      head :unprocessable_entity
    end
  end

  private
    def ground_station_params
      params.require(:ground_station).permit(:area_id, :lat, :long)
    end
end
