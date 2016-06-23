class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :thumbnails
  accepts_nested_attributes_for :thumbnails

  validates :catchcopy,  presence: true
  validates :concept,     presence: true
  validates :title,       presence: true
end
