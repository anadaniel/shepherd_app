require 'rails_helper'

RSpec.describe GroundStation, type: :model do
  let(:ground_station) { FactoryGirl.create :ground_station }

  subject { ground_station }

  context 'attributes' do
    it { is_expected.to respond_to(:area_id) }
  end

  context 'associations' do
    it { is_expected.to have_many(:logs) }
  end
end
