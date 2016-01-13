class Pictuer < ActiveRecord::Base
	self.per_page = 3

 	has_many :actives, as: :active
	belongs_to :album
	belongs_to :user
	
	has_attached_file :image, styles: { medium: "300x300>", thumb: "70x70>" }, default_url: "/images/:style/missing.png"
	
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	
  	scope :get_pictuer_public, -> { includes(:user).where(active: 1) }

  	scope :get_pictuers_by_id_album, -> (id) {includes(:album).where(album_id:id)}
end
