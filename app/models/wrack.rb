class Wrack < ActiveRecord::Base
	has_many :wines
	has_many :users
end
