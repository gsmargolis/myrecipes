require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "Luigi", email: "Luigi@example.com")
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "This is the best chicken parm recipe", 
    description: "heat oil, add onions, add tomatoes, add chicken, cook for 20 minutes")
  end


  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "recipe must have a name" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test  "name must be correct size" do
    @recipe.name = "a" * 4
    assert_not @recipe.valid?, "Name too short"
    @recipe.name = "a" * 101
    assert_not @recipe.valid?, "Name too long"
    @recipe.name = "chicken parm"
    assert @recipe.valid?, "Name not correct size"
    
  end

  test  "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid? 
  end
  
  test  "summary must be correct size" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?, "summary too short"
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?, "summary too long"
    @recipe.summary = "chicken parm jsdfl lsj dflj lsdfj "
    assert @recipe.valid?, "summary not correct size"
  
  end
  
  test "description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?  
  end

  test "description must be correct size" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?, "description too short"
    @recipe.description = "a" * 501
    assert_not @recipe.valid?, "description too long"
    @recipe.description = "chicken parm jsdfl lsj dflj lsdfj kdf;g l; dfg; ;ldfgk ;ldkf ;g ;dfgk k"
    assert @recipe.valid?, "description not correct size"
  end

  
  
  
end