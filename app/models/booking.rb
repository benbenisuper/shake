class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :review

  validates :start, presence: true
  validates :end, presence: true

  def status_nice
    return "Payment pending" if self.status == "1"
    return "Confirmed" if self.status == "2"
    return "Finished" if self.status == "3"
    return "PROBLEM"
  end
end
