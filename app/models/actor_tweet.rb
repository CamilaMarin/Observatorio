class ActorTweet < ActiveRecord::Base
	belongs_to :tweet
	belongs_to :actor
end
