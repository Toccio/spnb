class Superpower < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reservations
end
