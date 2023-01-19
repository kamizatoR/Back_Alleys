class Reply < ApplicationRecord
  belongs_to :end_user
  belongs_to :comment
  has_many :likes, as: :tableable
end
