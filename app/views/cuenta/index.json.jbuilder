json.array!(@cuenta) do |cuentum|
  json.extract! cuentum, :id, :id_cuenta, :id_actor, :nombre_cuenta, :cantidad_seguidores
  json.url cuentum_url(cuentum, format: :json)
end
