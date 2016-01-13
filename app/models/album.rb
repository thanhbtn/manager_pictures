class Album < ActiveRecord::Base
	self.per_page = 3

	has_many :actives, as: :active
	has_many :pictuers, autosave: true
	belongs_to :user

	accepts_nested_attributes_for :pictuers
	
	scope :get_album_public, ->{includes(:pictuers).includes(:user).where("active = ?", 1).order(updated_at: :desc)} 
	
end
 