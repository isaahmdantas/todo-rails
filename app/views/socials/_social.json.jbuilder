json.extract! social, :id, :name, :url, :icon, :user_id, :created_at, :updated_at
json.url social_url(social, format: :json)
