class Post < ApplicationRecord
  belongs_to :users, optional: true
  has_many :comments
  
  validates :text, presence: true, length: { maximum: 400 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def user
    return User.find_by(id: self.user_id)
  end
end
