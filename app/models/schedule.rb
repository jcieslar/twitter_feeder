class Schedule < ApplicationRecord
  validates :time, uniqueness: true, presence: true

  class << self
    def available?
      time_now = Time.now
      hour = time_now.hour
      minute = time_now.min
      schedule_time = Time.new(2000,1,1, hour, minute)

      where(time: schedule_time).present?
    end
  end
end
