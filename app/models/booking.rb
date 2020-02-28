class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :review

  validates :start, presence: true
  validates :end, presence: true

  def is_completed?
    (Date.today + 3) > self.end
  end

  def is_commented?
    !Review.find_by(booking_id: self.id).nil?
  end

  def can_comment?
    is_completed? && !is_commented?
  end

  def show_comment?
    is_completed? && is_commented?
  end

  def days
    number = (self.end - self.start).to_i + 1
    number == 1 ? text = "#{number} day" : text = "#{number} days"
    return text
  end

  def status_nice
    return "Payment pending" if self.status == "1"
    return "Confirmed" if self.status == "2"
    return "Finished" if self.status == "3"
    return "PROBLEM"
  end

  def update_status
    self.status = "3" if is_completed?
    self.save
  end
end
