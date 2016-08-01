json.extract! membership, :id, :organization_id, :user_id, :name, :role, :created_at, :updated_at
json.url membership_url(membership, format: :json)