json.array!(@hashtags) do |hashtag|
  json.extract! hashtag, :id, :id_hashtag, :id_actor, :nombre_hashtag
  json.url hashtag_url(hashtag, format: :json)
end
