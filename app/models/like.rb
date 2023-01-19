class Like < ApplicationRecord
  belongs_to :end_uesr
  belongs_to :tableable, polymorphic: true
end
