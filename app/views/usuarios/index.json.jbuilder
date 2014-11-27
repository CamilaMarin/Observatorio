json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :id_usuario, :cuenta
  json.url usuario_url(usuario, format: :json)
end
