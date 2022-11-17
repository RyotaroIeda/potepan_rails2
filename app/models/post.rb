class Post < ApplicationRecord
	mount_uploader :image_name, ImageNameUploader
	has_many :reservations

	validates :name, presence: true
	validates :address, presence: true
	validates :introduce, presence: true
	validates :image_name, presence: true
	validates :price, presence: true
	
end
