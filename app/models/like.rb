class Like < ApplicationRecord
  belongs_to :end_user
  belongs_to :table, polymorphic: true

  def liked_by?
    self.where(end_user_id: end_user.id).present?
  end

  def unliked(end_uesr)
    self.where(end_user: end_user)
  end
  
  def liked_count
    likes.count
  end


end
