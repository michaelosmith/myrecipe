require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Chicken Parma", summary: "This is the best chicken parm ever", description: "Heat oil, add chicken, cook for 20 minutes")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id must be present" do
    @recipe.chef_id = nil
    assert_not @chef.valid?
  end
  
  test "name should be present" do
    @recipe.name =  ""
    assert_not @recipe.valid?
  end
  
  test "name length should be min 5" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "name length should be max 50" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
  test "summary length should be min 10" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "summary length should be max 150" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
  test "description length should be min 20" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
  test "description length should be max 500" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
end