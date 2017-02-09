class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(tweeted_at: :desc).page(params[:page])
  end
end
