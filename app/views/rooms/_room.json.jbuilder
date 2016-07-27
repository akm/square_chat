json.extract! room, :id, :organization_id, :name, :created_at, :updated_at
json.url room_url(room, format: :json)