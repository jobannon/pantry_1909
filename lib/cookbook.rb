require 'pry'

class Cookbook
  attr_reader :recipes
  def initialize
    @recipes = Array.new
    @summary_hash = Hash.new
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def create_details_hash(recipe)
    create_incredients_array
    {:ingredients => recipe.ingredients_required, :total_calories => recipe.total_calories}
  end

  def create_incredients_array
  end 

  def summary
    result = @recipes.map do |recipe|
        @summary_hash[:name] = recipe.name
        @summary_hash[:details] = create_details_hash(recipe)
        # binding.pry
    end
    binding.pry
  end
end

:name => recipe.name, :details => hash

=> [
    {:name=>"Mac and Cheese",
        :details=>
          {:ingredients=>
            [
              {:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}
            ],
            :total_calories=>440
          }
    },
    {:name=>"Burger",
        :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}
   ]
