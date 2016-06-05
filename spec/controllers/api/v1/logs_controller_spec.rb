require 'rails_helper'

RSpec.describe Api::V1::LogsController, type: :controller do

  describe "GET #index" do
    before do
      @ground_station = FactoryGirl.create :ground_station
      3.times { FactoryGirl.create :log, ground_station: @ground_station  }
      get :index
    end

    it { should respond_with :ok }
    it { expect(json_response).to have_key(:logs) }
    it { expect(json_response[:logs].size).to eq(3) }
  end

  describe "POST #create" do
    before do
      ground_station = FactoryGirl.create :ground_station
      post :create, { ground_station_id: ground_station.id, 
                      log:  {
                        event: 'detected',
                        drone_mac_address: '01:23:45:67:89:AB'
                      }
                    }
    end

    it { should respond_with :created }
    it { expect(json_response).to have_key(:log) }
    it { expect(json_response[:log][:event]).to eq 'detected' }
  end

end
