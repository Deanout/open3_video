json.extract! post, :id, :title, :body, :random_number, :created_at, :updated_at
json.url post_url(post, format: :json)
