json.extract! entry, :id, :title, :body, :blog_id, :created_at, :updated_at
json.url blog_entries_path(blog, format: :json)