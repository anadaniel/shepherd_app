class Api::V1::DronesController < ApplicationController
  def take_control
    drone = Drone.find_by mac_address: params[:drone_mac_address]
    render json: { take_control: drone.controlled_by_id.nil? }.to_json, status: :ok
  end
end
