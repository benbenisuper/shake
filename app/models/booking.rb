class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :comment, presence: true
  validates :status, presence: true

end
