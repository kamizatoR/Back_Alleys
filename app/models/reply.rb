class Reply < ApplicationRecord
  belongs_to :end_user
  belongs_to :comment
end
