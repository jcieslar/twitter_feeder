require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '#validations' do
    subject { build(:tweet) }
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:tweeted_at) }
  end
end
