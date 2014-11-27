json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :id_tweet, :id_texto, :id_usuario, :region, :fecha, :clasificacion
  json.url tweet_url(tweet, format: :json)
end
