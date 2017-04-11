json.extract! hive_category, :id, :cat_id, :name, :description, :created_at, :updated_at
json.url hive_category_url(hive_category, format: :json)