json.extract! item, :id, :title, :author, :description, :price, :image_url, :category, :created_at, :updated_at
json.url item_url(item, format: :json)
