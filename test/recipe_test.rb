require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/recipe'
require './lib/ingredient'
require 'pry'

class RecipeTest < Minitest::Test
  def setup
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @cheese = Ingredient.new("Cheese", "oz", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @mac_and_cheese.name
    assert_equal Hash.new, @mac_and_cheese.ingredients_required
  end

  def test_it_can_add_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert @mac_and_cheese.ingredients_required.keys.include?(@cheese)
    assert @mac_and_cheese.ingredients_required.keys.include?(@mac)

    assert @mac_and_cheese.ingredients_required.values.include?(2)
    assert @mac_and_cheese.ingredients_required.values.include?(8)
    assert @mac_and_cheese.ingredients_required.values.sum(10)
  end

  def test_it_can_return_amount_required_by_ingredient
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_it_can_list_all_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert @mac_and_cheese.ingredients.include?(@cheese)
    assert @mac_and_cheese.ingredients.include?(@mac)
    assert_equal 2, @mac_and_cheese.ingredients.length
  end

  def test_it_can_calculate_total_calories
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 440, @mac_and_cheese.total_calories
  end
end
