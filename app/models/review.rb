class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :wine

	validates :body, presence: true
end
 