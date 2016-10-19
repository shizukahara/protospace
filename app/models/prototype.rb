class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails
  has_many :comments
  accepts_nested_attributes_for :thumbnails, allow_destroy: true

  validates :catchcopy,  presence: true
  validates :concept,     presence: true
  validates :title,       presence: true
end
