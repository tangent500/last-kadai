class Diarypost < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :picture, presence: true

  belongs_to :user
  
  mount_uploader :picture, PictureUploader
end
