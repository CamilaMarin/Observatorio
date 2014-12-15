class Actor < ActiveRecord::Base
	has_many :actor_tweet
	has_many :hashtag
	has_many :cuenta
	has_many :palabra_clave
end
