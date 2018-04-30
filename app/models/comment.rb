class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, presence: true

 scope :rating_desc, -> { order(rating: :desc) } 
end
