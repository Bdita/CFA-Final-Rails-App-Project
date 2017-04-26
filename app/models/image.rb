class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validate :picture_size

#after test
  validates :title, presence: true, length: { minimum: 2 }
  validates :artist_name, presence: true, length: { minimum: 2 }
  validates :artist_age, presence: true, numericality: { only_integer: true,  greater_than: 0}
  validates :user_id, presence:true

private
  def picture_size
       if picture.size > 5.megabytes
            errors.add(:picture, "should be less than 5MB")
       end
  end
end
