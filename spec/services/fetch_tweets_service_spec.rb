require "rails_helper"

describe FetchTweetsService do
  subject { FetchTweetsService.new }

  context "Fetch tweets and save it" do
    before do
      allow_any_instance_of(TwitterSearchService).to receive(:call).and_return(tweets_collection)
    end

    let(:time_now) { Time.now }
    let(:twitter_user) do
      OpenStruct.new(profile_image_url: 'awesome_url', screen_name: 'xyz')
    end
    let(:tweet_structure) do
      OpenStruct.new(id: 123, text: 'abc', created_at: time_now, user: twitter_user)
    end
    let(:tweets_collection) { [tweet_structure, tweet_structure] }

    it "should persist 2 Tweets" do
      subject.call

      last_tweet = Tweet.last
      expect(Tweet.count).to eq(2)
      expect(last_tweet.external_id).to eq("123")
      expect(last_tweet.content).to eq("abc")
      expect(last_tweet.username).to eq("xyz")
      expect(last_tweet.tweeted_at).to eq(time_now)
      expect(last_tweet.avatar).to eq("awesome_url")
    end
  end
end
