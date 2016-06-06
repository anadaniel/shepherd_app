require 'rails_helper'

RSpec.describe Drone, type: :model do
  let(:drone) { FactoryGirl.create :drone }

  subject { drone }

  context 'attributes' do
    it { is_expected.to respond_to :mac_address }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :mac_address }
    it { is_expected.to validate_uniqueness_of :mac_address }
  end

  context 'associations' do
    it { is_expected.to belong_to :controlled_by }
  end
end
