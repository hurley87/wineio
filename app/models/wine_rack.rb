class WineRack < ActiveRecord::Base
	has_many :user
	has_many :wines
end
