class Like < ApplicationRecord
  belongs_to :end_user
  belongs_to :table, polymorphic: true

  def unliked(end_uesr)
    self.where(end_user: end_user)
  end

  def liked_count
    likes.count
  end


end
