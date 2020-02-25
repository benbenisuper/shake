class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: :true
  validates :category, presence: :true
  validates :location, presence: :true
  validates :description, presence: :true
  validates :capacity, presence: :true

end
