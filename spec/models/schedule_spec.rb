require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe '#validations' do
    subject { build(:schedule) }
    it { is_expected.to validate_presence_of(:time) }
    it { is_expected.to validate_uniqueness_of(:time) }
  end

  describe '#available?' do
    subject { Schedule.available? }
    let!(:time_now) { Time.new(2000,1,1, Time.now.hour, Time.now.min) }
    let!(:schedule_1) { create(:schedule, time: time_now) }
    let!(:schedule_2) { create(:schedule, time: time_now + 10.minutes) }
    let!(:schedule_3) { create(:schedule, time: time_now - 10.minutes) }

    before do
      Timecop.freeze(Time.now)
    end

    it 'should return true when Schedule is present for current time' do
      expect(subject).to eq(true)
    end

    it 'should return false when Schedule is not present for current time' do
      schedule_1.update(time: time_now + 5.minutes)
      expect(subject).to eq(false)
    end
  end

end
