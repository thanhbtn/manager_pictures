class Active < ActiveRecord::Base
	belongs_to :active, polymorphic: true
end
