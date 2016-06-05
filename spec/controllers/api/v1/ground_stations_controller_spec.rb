require 'rails_helper'

RSpec.describe Api::V1::GroundStationsController, type: :controller do

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
end
