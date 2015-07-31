json.array!(@showdowns) do |showdown|
  json.extract! showdown, :id
  json.url showdown_url(showdown, format: :json)
end
