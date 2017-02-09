class TwitterSearchService
  attr_reader :client
  SEARCH_QUERY =  "Aleppo"
  FEEDS_NUMBER = 500

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CUSTOMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CUSTOMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  def call
    begin
      client
        .search(SEARCH_QUERY, result_type: "recent", count: FEEDS_NUMBER)
        .take(FEEDS_NUMBER)
    rescue Twitter::Error => error
      puts error
    end
  end
end
