class Post < ApplicationRecord
  belongs_to :end_user
  has_many :comments, dependent: :destroy
  has_one_attached :image
end
