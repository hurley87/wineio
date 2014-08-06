class Wine < ActiveRecord::Base
	has_many :reviews
	has_many :ratings
	# belongs_to :user, through: :wine_rack

	def average_rating 
		stars = []
		self.ratings.each do |rating|
			stars << rating.stars
		end
		stars[0..-2].inject(:+) / stars.count if stars.count != 0
	end
end
