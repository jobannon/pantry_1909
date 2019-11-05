require 'pry'

class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    view_all = recipe.ingredients.map do |ingredient|
      stock_check(ingredient) >= recipe.ingredients_required[ingredient]
    end
    !(view_all.include?(false))
  end
end


 ### keeping this here until completed with iteration4
# view_all = recipe.ingredients.map do |ingredient|
#   if stock_check(ingredient) < recipe.ingredients_required[ingredient]
#     false
#   else
#     true
#   end
# end
# if view_all.include?(false)
#   return false
# else
#   return true
# end
