require "rails_helper"

describe TweetService do
  subject { TweetService.new(tweet_structure) }

  context "valid twitter response structure" do
    let(:time_now) { Time.now }
    let(:twitter_user) do
      OpenStruct.new(profile_image_url: 'awesome_url', screen_name: 'xyz')
    end
    let(:tweet_structure) do
      OpenStruct.new(id: 123, text: 'abc', created_at: time_now, user: twitter_user)
    end

    it "should persist Tweet" do
      subject.save!
      last_tweet = Tweet.last
      expect(Tweet.count).to eq(1)
      expect(last_tweet.external_id).to eq("123")
      expect(last_tweet.content).to eq("abc")
      expect(last_tweet.username).to eq("xyz")
      expect(last_tweet.tweeted_at).to eq(time_now)
      expect(last_tweet.avatar).to eq("awesome_url")
    end
  end

  context "invalid twitter response structure" do
    let(:time_now) { Time.now }
    let(:twitter_user) do
      OpenStruct.new(profile_image_url: 'awesome_url', screen_name: 'xyz')
    end
    let(:tweet_structure) do
      OpenStruct.new(id: 123, text: nil, created_at: time_now, user: twitter_user)
    end

    it "should not persist Tweet" do
      subject.save!
      expect(Tweet.count).to eq(0)
    end
  end
end
