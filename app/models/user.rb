class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :password, length: { minimum: 6 }, on: :create
  validates :password, length: { minimum: 6 }, on: :update, allow_blank: true

  validates :work, presence: true
  validates :nickname, presence: true
  validates :profile, presence: true
  validates :member, presence: true

  mount_uploader :avatar, ImageUploader

  has_many :prototypes


end
