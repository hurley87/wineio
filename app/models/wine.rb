class Wine < ActiveRecord::Base
	has_many :reviews
	has_many :ratings
	belongs_to :wine_rack
	geocoded_by :get_location
	before_save :geocode

	def get_location
		self.location
	end

	def average_rating 
		stars = []
		self.ratings.each do |rating|
			stars << rating.stars
		end
		if stars == [nil]
			return 0
		elsif stars.count == 1
			return stars[0]
		else
	 	 return stars[0..-2].inject(:+) / self.ratings.count
	 	end
	end
end
