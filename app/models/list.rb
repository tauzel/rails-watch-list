class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  # Allows users to post images through Cloudinary
  has_one_attached :user_img

  validates :name, uniqueness: true, presence: true
end
