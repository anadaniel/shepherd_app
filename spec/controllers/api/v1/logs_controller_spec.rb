require 'rails_helper'

RSpec.describe Api::V1::LogsController, type: :controller do

  describe "GET #index" do
    before do
      3.times { FactoryGirl.create :log }
      get :index
    end

    it { should respond_with :ok }
    it { expect(json_response).to have_key(:logs) }
    it { expect(json_response[:logs].size).to eq(3) }
  end

end
