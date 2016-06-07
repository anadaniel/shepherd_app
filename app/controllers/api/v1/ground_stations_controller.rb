class Api::V1::GroundStationsController < ApplicationController
  def index
    ground_stations = GroundStation.all
    render json: ground_stations, status: :ok
  end

  def show
    ground_station = GroundStation.find_by id: params[:id]
    if ground_station.present?
      render json: ground_station, status: :ok
    else
      head :not_found
    end
  end

  def create
    ground_station = GroundStation.new ground_station_params
    if ground_station.save
      render json: ground_station, status: :created
    else
      head :unprocessable_entity
    end
  end

  def update
    ground_station = GroundStation.find_by id: params[:id]
    if ground_station.present? and ground_station.update ground_station_params
      render json: ground_station, status: :ok
    else
      head :unprocessable_entity
    end
  end

  private
    def ground_station_params
      params.require(:ground_station).permit(:area_id, :lat, :long, :mac_address)
    end
end
