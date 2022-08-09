class Superpower < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_superpower_name,
    against: [ :name, :superpower_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
