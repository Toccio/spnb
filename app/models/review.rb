class Review < ApplicationRecord
  belongs_to :reservation
  validates :content, presence: true
  validates :rating, presence: true
end
