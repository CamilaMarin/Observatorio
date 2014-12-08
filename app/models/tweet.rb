class Tweet < ActiveRecord::Base
	belongs_to :usuario
	has_many :actor_tweet
end
