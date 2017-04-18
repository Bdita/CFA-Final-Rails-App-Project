json.extract! image, :id, :title, :picture, :artist_name, :artist_age, :artist_country, :user_id, :created_at, :updated_at
json.url image_url(image, format: :json)
