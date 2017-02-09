require 'clockwork'
require_relative './config/boot'
require_relative './config/environment'
include Clockwork

every(1.minute, 'Fetch Tweets from Twitter') { FetchTweetsJob.new.perform }
