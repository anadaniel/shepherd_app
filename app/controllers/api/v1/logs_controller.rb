class Api::V1::LogsController < ApplicationController
  def index
    logs = Log.includes(:ground_station).all.order("created_at DESC").limit(15)
    render json: logs, status: :ok
  end

  def create
    ground_station = GroundStation.find params[:ground_station_id]
    log = ground_station.logs.build log_params
    if log.save
      render json: log, status: :created
    else
      head :unprocessable_entity
    end
  end

  private
    def log_params
      params.require(:log).permit(:event, :drone_mac_address)
    end
end
