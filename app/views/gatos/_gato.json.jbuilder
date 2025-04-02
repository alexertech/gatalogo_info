json.extract! gato, :id, :name, :breed, :description, :image, :user_id, :created_at, :updated_at
json.url gato_url(gato, format: :json)
