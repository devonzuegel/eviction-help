json.array!(@courts) do |court|
  json.extract! court, :id, :street_address, :mailing_address, :city, :zip_code, :branch_name, :county
  json.url court_url(court, format: :json)
end
