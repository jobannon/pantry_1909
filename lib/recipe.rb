require 'pry'

class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount_required)
    @ingredients_required[ingredient] = amount_required
  end

  def total_calories
    ingredients.sum do |ingredient|
      ingredient.calories * amount_required(ingredient)
    end
    # ingredients * amount_required
    #ingredient.calories * amount_required
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end
end
