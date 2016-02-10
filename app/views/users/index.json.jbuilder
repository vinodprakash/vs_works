json.array!(@users) do |user|
  json.extract! user, :id, :name, :degree
  json.url user_url(user, format: :json)
end
