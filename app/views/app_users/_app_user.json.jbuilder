json.extract! app_user, :id, :email, :first_name, :last_name, :role, :created_at, :updated_at
json.url app_user_url(app_user, format: :json)
