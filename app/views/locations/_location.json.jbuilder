json.extract! location, :id, :state, :country, :home, :pincode, :created_at, :updated_at
json.url location_url(location, format: :json)
