json.extract! hive_information, :id, :title, :description, :responsible, :note, :solution, :category_id, :is_active, :created_at, :updated_at
json.url hive_information_url(hive_information, format: :json)