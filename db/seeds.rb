require 'json'
require 'open-uri'


Ingredient.destroy_all

file = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredient_serialized = open(file).read
ingredient = JSON.parse(ingredient_serialized)

ingredient["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end
