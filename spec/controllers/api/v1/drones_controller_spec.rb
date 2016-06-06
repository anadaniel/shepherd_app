require 'rails_helper'

RSpec.describe Api::V1::DronesController, type: :controller do

  describe 'GET #take_control' do
    before do
      @ground_station = FactoryGirl.create :ground_station
    end

    context 'drone is free' do
      before do
        @drone = FactoryGirl.create :drone
        get :take_control, { drone_mac_address: @drone.mac_address }
      end

      it { should respond_with :ok }
      it { expect(json_response).to have_key(:take_control) }
      it { expect(json_response[:take_control]).to eq true }
    end

    context 'drone is not free' do
      before do
        @drone = FactoryGirl.create :drone, controlled_by_id: @ground_station.id
        get :take_control, { drone_mac_address: @drone.mac_address }
      end

      it { should respond_with :ok }
      it { expect(json_response).to have_key(:take_control) }
      it { expect(json_response[:take_control]).to eq false }
    end
  end
end
