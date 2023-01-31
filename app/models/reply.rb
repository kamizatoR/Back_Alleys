class Reply < ApplicationRecord
  belongs_to :end_user
  belongs_to :comment
  has_many :likes, as: :table, dependent: :destroy
  
  validates :body, presence: true
  
end
