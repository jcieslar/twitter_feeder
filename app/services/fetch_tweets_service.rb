class FetchTweetsService
  attr_accessor :tweets

  def call
    search_tweets
    save_tweets!
  end

  private

  def search_tweets
    @tweets = TwitterSearchService.new.call
  end

  def save_tweets!
    tweets.each do |tweet|
      TweetService.new(tweet).save!
    end
  end

end
