class Like < ApplicationRecord
  belongs_to :end_user
  belongs_to :table, polymorphic: true
end
