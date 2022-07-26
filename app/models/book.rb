class Book < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :title, presense: true
  validates :body, presense: true

end
