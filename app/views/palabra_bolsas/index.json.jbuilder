json.array!(@palabra_bolsas) do |palabra_bolsa|
  json.extract! palabra_bolsa, :id, :id_palabrab, :nombre_palabra, :puntaje
  json.url palabra_bolsa_url(palabra_bolsa, format: :json)
end
