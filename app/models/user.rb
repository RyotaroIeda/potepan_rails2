class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  mount_uploader :image_name, ImageNameUploader

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end