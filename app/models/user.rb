class User < ActiveRecord::Base
	authenticates_with_sorcery!
	has_many :reviews
	has_many :ratings
	has_one :wine_rack
	has_many :wines, :through => :wine_rack

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
