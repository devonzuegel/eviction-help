json.array!(@cases) do |case|
  json.extract! case, :id, :case_number, :rent_due
  json.url case_url(case, format: :json)
end
