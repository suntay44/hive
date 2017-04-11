json.extract! userlogin, :id, :name, :created_at, :updated_at
json.url userlogin_url(userlogin, format: :json)