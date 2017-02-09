class Tweet < ApplicationRecord
  validates :external_id, :content, :username, :tweeted_at, presence: true
end
