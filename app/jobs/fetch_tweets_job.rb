class FetchTweetsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    FetchTweetsService.new.call if Schedule.available?
  end
end
