class Post < ApplicationRecord
  belongs_to :end_user
  has_many :comments
  has_one_attached :image
end
