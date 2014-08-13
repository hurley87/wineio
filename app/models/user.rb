class User < ActiveRecord::Base
  authenticates_with_sorcery!
	authenticates_with_sorcery!
	has_many :reviews
	has_many :ratings
	belongs_to :wrack

	validates :name, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
