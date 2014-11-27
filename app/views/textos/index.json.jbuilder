json.array!(@textos) do |texto|
  json.extract! texto, :id, :id_tweet, :id_texto, :texto
  json.url texto_url(texto, format: :json)
end
