class Thumbnail < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image_url, ImageUploader

  enum status: { main: 0, sub: 1 }
  validates :status, presence: true
end
