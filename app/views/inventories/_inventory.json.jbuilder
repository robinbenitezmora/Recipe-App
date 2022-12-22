json.extract! inventory, :id, :name, :measurement_unit, :price, :quantity, :user_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
