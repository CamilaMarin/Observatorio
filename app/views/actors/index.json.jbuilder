json.array!(@actors) do |actor|
  json.extract! actor, :id, :id_actor, :nombre_actor
  json.url actor_url(actor, format: :json)
end
