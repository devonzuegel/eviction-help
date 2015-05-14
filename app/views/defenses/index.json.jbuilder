json.array!(@defenses) do |defense|
  json.extract! defense, :id, :description
  json.url defense_url(defense, format: :json)
end
