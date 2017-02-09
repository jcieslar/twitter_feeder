class TweetService
  attr_reader :tweet

  def initialize(tweet)
    @tweet = tweet
  end

  def save!
    Tweet.create!(
      external_id: tweet.id,
      content:     tweet.text,
      username:    tweet.user.screen_name,
      avatar:      tweet.user.profile_image_url,
      tweeted_at:  tweet.created_at
    )
  end
end
