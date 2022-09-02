class Post < ApplicationRecord
	mount_uploader :image_name, ImageNameUploader
	
	validates :name, {presence: true}
	validates :price, {presence:	true}
	validates :address, {presence:	true}
	validates :image_name, {presence:	true}
	validates :introduce, {presence: true}	

end
