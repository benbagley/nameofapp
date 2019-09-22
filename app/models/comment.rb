class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  #rank the ratings in descending order
  scope :rating_desc, -> { order(rating: :desc) }

  #rank the ratings in ascending order
  scope :rating_asc, -> { order(rating: :asc) }

end