json.extract! project, :id, :name, :color, :favorite, :view, :user_id, :created_at, :updated_at
json.url app_project_url(project, format: :json)
