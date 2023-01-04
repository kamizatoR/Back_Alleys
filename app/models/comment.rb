class Comment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post
  has_many :replies, dependent: :destroy
end
