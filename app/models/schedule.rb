class Schedule < ApplicationRecord
  validates :time, uniqueness: true, presence: true
end
