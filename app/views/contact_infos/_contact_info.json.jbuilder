json.extract! contact_info, :id, :contact_id, :type, :number, :created_at, :updated_at
json.url contact_info_url(contact_info, format: :json)
