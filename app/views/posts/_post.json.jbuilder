json.extract! post, :id, :author_name, :title, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
