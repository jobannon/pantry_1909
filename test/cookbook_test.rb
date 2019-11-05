require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/ingredient'
require './lib/recipe'
require './lib/cookbook'


class CookbookTest < Minitest::Test
  def setup
    @cookbook = Cookbook.new
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    @bun = Ingredient.new("Bun", "g", 1)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @burger = Recipe.new("Burger")

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    @burger.add_ingredient(@ground_beef, 4)
    @burger.add_ingredient(@bun, 100)

  end

  def test_it_exists
    assert_instance_of Cookbook, @cookbook
  end

  def test_add_recipe
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)

    assert_equal [@mac_and_cheese, @burger], @cookbook.recipes
  end

  def test_summary
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)
    @cookbook.summary
  end

end
