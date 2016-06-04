require 'rails_helper'

RSpec.describe Log, :type => :model do
  let(:log) { FactoryGirl.create :log }

  subject { log }

  context 'attributes' do
    it { is_expected.to respond_to(:event) }
    it { is_expected.to respond_to(:drone_mac_address) }
  end
end
