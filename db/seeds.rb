require 'json'
require 'open-uri'


Ingredient.destroy_all

file = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredient_serialized = open(file).read
ingredient = JSON.parse(ingredient_serialized)

ingredient["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end


Cocktail.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"

cocktail_serialized = open(url).read
cocktail = JSON.parse(cocktail_serialized)

cocktail["drinks"].each do |cocktail|
  Cocktail.create!(name: cocktail["strDrink"])
end
