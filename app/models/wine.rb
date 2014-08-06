class Wine < ActiveRecord::Base
	has_many :reviews
	has_many :ratings
end
