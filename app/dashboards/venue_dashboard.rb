require "administrate/base_dashboard"

class VenueDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    bookings: Field::HasMany,
    reviews: Field::HasMany,
    photos_attachments: Field::HasMany.with_options(class_name: "ActiveStorage::Attachment"),
    photos_blobs: Field::HasMany.with_options(class_name: "ActiveStorage::Blob"),
    id: Field::Number,
    name: Field::String,
    location: Field::String,
    category: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    capacity: Field::Number,
    activity: Field::String,
    price: Field::Number,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  user
  bookings
  reviews
  photos_attachments
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  user
  bookings
  reviews
  photos_attachments
  photos_blobs
  id
  name
  location
  category
  description
  created_at
  updated_at
  capacity
  activity
  price
  latitude
  longitude
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  user
  bookings
  reviews
  photos_attachments
  photos_blobs
  name
  location
  category
  description
  capacity
  activity
  price
  latitude
  longitude
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how venues are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(venue)
  #   "Venue ##{venue.id}"
  # end
end
