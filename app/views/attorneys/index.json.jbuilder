json.array!(@attorneys) do |attorney|
  json.extract! attorney, :id, :office_address, :fax_number, :bar_number
  json.url attorney_url(attorney, format: :json)
end
