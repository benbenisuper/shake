class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: :true
  validates :category, presence: :true
  validates :location, presence: :true
  validates :description, presence: :true
  validates :capacity, presence: :true
  validates :price, presence: :true, numericality: { only_integer: true }

end
