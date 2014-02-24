json.array!(@events) do |event|
  json.extract! event, :id, :name, :address, :description, :type, :cost, :dateTime, :capacity, :website, :user_id
  json.url event_url(event, format: :json)
end
