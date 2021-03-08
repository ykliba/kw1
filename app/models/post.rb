class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  
  validates :text, presence: true, length: { maximum: 400 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def user
    return User.find_by(id: self.user_id)
  end
end
