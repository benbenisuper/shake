class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :review

  validates :start, presence: true
  validates :end, presence: true

end
