json.extract! recipe, :id, :name, :quantity, :measure, :cost, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
