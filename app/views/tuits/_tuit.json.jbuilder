json.extract! tuit, :id, :description, :username, :created_at, :updated_at
json.url tuit_url(tuit, format: :json)
