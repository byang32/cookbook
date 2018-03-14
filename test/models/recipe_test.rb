require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "create a valid record" do
    recipe = Recipe.new
    recipe.title = "Ice water"
    recipe.ingredients = ["one glass", "water", "ice"].join("<br>")
    recipe.instructions = "Combine all ingredients into the glass and let sit for two minutes. Serve immediately."
    assert recipe.save
  end

  test "should not save unless title is filled in" do
    recipe = Recipe.new
    assert !recipe.save # save should fail because there are errors.
    assert recipe.errors[:title].include?("cant be blank")
  end

  test "should not save unless ingredients is filled in" do
    recipe = Recipe.new
    assert !recipe.save # save should fail because there are errors.
    assert recipe.errors[:ingredients].include?("cant be blank")
  end
  
  test "should not save unless instructions is filled in" do
    recipe = Recipe.new
    assert !recipe.save # save should fail because there are errors.
    assert recipe.errors[:instructions].include?("cant be blank")
  end
  
  test "should only have one recipe witht the same name" do
    @recipe = Recipe.new(:title =>"Toast")
    @recipe.valid?
    assert @recipe.errors[:title].include?("must be unique")
  end
  
  test "should find a match on title" do
    test_recipe = Recipe.create(title: "Cake",
                                ingredients: "Flour, sugar, eggs.",
                                instructions: "Mix ingredients...")
    assert_equal test_recipe, Recipe.find_all_by_query("cake").first
  
  end
  
  test "should fin 2 matches on title" do
    Recipe.create!(title: "Cake",
                   ingredients: "Flour, sugar, eggs.",
                   instructions: "Mix ingredients...")
                   
    Recip.create!(title: "Pankcakes",
                  ingredients: "flour, butter, eggs.",
                  instructions: "Mix ingredients in a large bowl...")
                  
    assert_equal 2, Recipe.find_all_by_query("cake").count
    end
    
    test "should find a match on ingredients" do
    test_recipe = Recipe.create(title: "Cake",
                                ingredients: "Flour, sugar, eggs.",
                                instructions: "Mix ingredients...")
    assert_equal test_recipe, Recipe.find_all_by_query("flour").first
  
    end
  
    test "should find a match on instructions" do
    test_recipe = Recipe.create(title: "Cake",
                                ingredients: "Flour, sugar, eggs.",
                                instructions: "Mix ingredients...")
    assert_equal test_recipe, Recipe.find_all_by_query("mix").first
  
    end
  
end
