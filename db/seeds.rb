require 'json'
require 'open-uri'


Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all
ingr_array = []
cocktail_array = []

file = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredient_serialized = open(file).read
ingredient = JSON.parse(ingredient_serialized)

ingredient["drinks"].each do |ingredient|
  ingr = Ingredient.create!(name: ingredient["strIngredient1"])
  ingr_array << ingr
end


url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"

cocktail_serialized = open(url).read
cocktail = JSON.parse(cocktail_serialized)

cocktail["drinks"].each do |cocktail|
  cocktail = Cocktail.create!(name: cocktail["strDrink"])
  cocktail_array << cocktail
end

cocktail_array.each do |cocktail|
  n = rand(1..5)
  ing = ingr_array.sample(n)
  ing.each do |ingredient|
    Dose.create!(description: "Gently add #{rand(1..10)} cl of #{ingredient.name}", cocktail: cocktail, ingredient: ingredient)
  end
end

