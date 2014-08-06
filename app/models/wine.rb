class Wine < ActiveRecord::Base
	has_many :reviews
	has_many :ratings

	def average_rating 
		stars = []
		self.ratings.each do |rating|
			stars << rating.stars
		end
		stars[0..-2].inject(:+) / stars.count
	end
end
