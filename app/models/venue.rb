class Venue < ApplicationRecord
  CATEGORIES = ["Private House", "Outdoor", "Castle"]
  ACTIVITIES = ["Wedding", "Dinner", "Work"]
  geocoded_by :location
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: :true
  validates :category, presence: :true
  validates :activity, presence: :true
  validates :location, presence: :true
  validates :description, presence: :true
  validates :capacity, presence: :true
  validates :price, presence: :true, numericality: { only_integer: true }

  after_validation :geocode, if: :will_save_change_to_location?

  def venue_image
    if self.photos.attached?
      self.photos.first.key
    else
      "defaultEventImage"
    end
  end
end
