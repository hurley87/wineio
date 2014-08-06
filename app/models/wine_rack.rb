class WineRack < ActiveRecord::Base
	belongs_to :user
	has_many :wines
end
