module TweetsHelper
  def link_to_tweet(tweet)
    link_to 'Show tweet', "https://twitter.com/statuses/#{tweet.external_id}"
  end

  def link_to_user(tweet)
    link_to tweet.username, "https://twitter.com/#{tweet.username}"
  end

  def tweeted_date(tweet)
    "Tweeted: #{tweet.tweeted_at.strftime('%Y-%m-%d %I:%M %p')}"
  end
end
