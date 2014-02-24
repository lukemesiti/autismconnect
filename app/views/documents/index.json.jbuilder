json.array!(@documents) do |document|
  json.extract! document, :id, :name, :type, :user_id
  json.url document_url(document, format: :json)
end
