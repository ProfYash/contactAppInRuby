json.extract! contact, :id, :full_name, :user_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
