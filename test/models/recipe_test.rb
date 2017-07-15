require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "joe", email: "joe@example.com")
    @recipe = @chef.recipes.build(name: "Chicken", description: "Steam chicken")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "recipe name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "recipe description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "recipe description should be more than 5 characters" do
    @recipe.description = "a" * 4
    assert_not @recipe.valid?
  end

  test "recipe description should be less than 1000 characters" do
    @recipe.description = "a" * 1001
    assert_not @recipe.valid?
  end

  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

end
