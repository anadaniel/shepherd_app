require 'rails_helper'

RSpec.describe Api::V1::GroundStationsController, type: :controller do

  describe "GET #show" do
    before do
      @ground_station = FactoryGirl.create :ground_station, area_id: 1, mac_address: '34:13:E8:35:30:1D'
      get :show, { id: @ground_station.id }
    end

    it { should respond_with :ok }
    it { expect(json_response).to have_key(:ground_station) }
    it { expect(json_response[:ground_station][:mac_address]).to eq(@ground_station.mac_address) }
  end

  describe "GET #index" do
    before do
      FactoryGirl.create :ground_station, area_id: 1
      FactoryGirl.create :ground_station, area_id: 2
      FactoryGirl.create :ground_station, area_id: 3
      get :index
    end

    it { should respond_with :ok }
    it { expect(json_response).to have_key(:ground_stations) }
    it { expect(json_response[:ground_stations].size).to eq(3) }
  end

  describe "POST #create" do
    before do
      post :create, { ground_station: {
                        area_id: 1,
                        lat: 25.678653, 
                        long: -100.284270,
                        mac_address: '34:13:E8:35:30:1D'
                      }
                    }
    end

    it { should respond_with :created }
    it { expect(json_response).to have_key(:ground_station) }
    it { expect(json_response[:ground_station][:mac_address]).to eq '34:13:E8:35:30:1D' }
  end

  describe "POST #update" do
    before do
      ground_station = FactoryGirl.create :ground_station, long: -200.000000
      put :update, { id: ground_station.id, ground_station: { long: '-100.000000' } }
    end

    it { should respond_with :ok }
    it { expect(json_response).to have_key(:ground_station) }
    it { expect(json_response[:ground_station][:long]).to eq '-100.0' }
  end
end
