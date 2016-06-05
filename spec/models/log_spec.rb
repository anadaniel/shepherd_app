require 'rails_helper'

RSpec.describe Log, :type => :model do
  let(:log) { FactoryGirl.create :log }

  subject { log }

  context 'attributes' do
    it { is_expected.to respond_to :event }
    it { is_expected.to respond_to :drone_mac_address }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :event }
  end

  context 'associations' do
    it { is_expected.to belong_to :ground_station }
    it { is_expected.to belong_to :drone }
  end

  context 'callbacks' do
    describe 'get_drone_from_mac_address' do
      context 'when the drone does not exist' do
        before do
          @log = FactoryGirl.build :log, event: 'detected', drone_mac_address: '34:13:E8:35:30:1D'
          @log.save
          @log.reload
          @drone = Drone.find_by mac_address: '34:13:E8:35:30:1D'
        end

        it 'creates a drone object' do
          expect(@drone).to_not be_nil
        end

        it 'sets the event to "new_detected"' do
          expect(@log.event).to eq("new_detected")
        end
      end

      context 'when the drone exists already' do
        before do
          @drone = FactoryGirl.create :drone, mac_address: '34:13:E8:35:30:1D'
          @log = FactoryGirl.build :log, event: 'detected', drone_mac_address: '34:13:E8:35:30:1D'
          @log.save
          @log.reload
        end

        it 'keeps the event as "detected"' do
          expect(@log.event).to eq("detected")
        end
      end
    end
  end
end
