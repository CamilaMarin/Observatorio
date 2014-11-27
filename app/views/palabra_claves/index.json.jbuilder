json.array!(@palabra_claves) do |palabra_clafe|
  json.extract! palabra_clafe, :id, :id_palabra, :id_actor, :nombre_palabra_clave
  json.url palabra_clafe_url(palabra_clafe, format: :json)
end
