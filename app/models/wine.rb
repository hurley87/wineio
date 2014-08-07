class Wine < ActiveRecord::Base
	has_many :reviews
	has_many :ratings
	# belongs_to :user, through: :wine_rack
	geocoded_by :get_location
	before_save :geocode

	def get_location
		self.location
	end

	def average_rating 
		stars = []
		avg = 0

		self.ratings.each do |rating|
			stars << rating.stars
		end

		if stars == [nil]
			avg = 0
		else
			avg = stars[0..-2].inject(:+) / self.ratings.count
		end

		avg
	end
end
