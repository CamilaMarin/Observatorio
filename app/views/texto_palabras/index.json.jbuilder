json.array!(@texto_palabras) do |texto_palabra|
  json.extract! texto_palabra, :id, :id_tp, :id_texto, :id_palabrab
  json.url texto_palabra_url(texto_palabra, format: :json)
end
