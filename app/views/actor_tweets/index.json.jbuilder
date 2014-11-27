json.array!(@actor_tweets) do |actor_tweet|
  json.extract! actor_tweet, :id, :id_at, :id_actor, :id_tweet
  json.url actor_tweet_url(actor_tweet, format: :json)
end
