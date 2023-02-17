class Review < ApplicationRecord
  belongs_to :user
  belongs_to :art
  validates :rating, :comment, presence: true
  validates :rating, numericality: { in: 1..5 }
end
