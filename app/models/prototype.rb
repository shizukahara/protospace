class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :thumbnails, allow_destroy: true

  validates :catchcopy,  presence: true
  validates :concept,     presence: true
  validates :title,       presence: true

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
