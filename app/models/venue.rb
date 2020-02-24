class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: :true
  validates :category, presence: :true
  validates :location, presence: :true
  validates :description, presence: :true
end
