json.array!(@links) do |link|
  json.extract! link, :id, :name, :url, :user_id
  json.url link_url(link, format: :json)
end
