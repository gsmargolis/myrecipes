require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "Luigi", email: "luigi@example.com")
  end
  
  test "chefname must be present" do
    @chef.chefname = ""
    assert_not @chef.valid?, "chefname must be present"
  end

  test "chefname must be the correct size" do
    @chef.chefname = "a" * 2
    assert_not @chef.valid?, "chefname to short"
    @chef.chefname = "a" * 40
    assert_not @chef.valid?, "chefname to long"
    @chef.chefname = "Luigi"
    assert @chef.valid?, "chefname is correct size"
  end
  
  test "email must be present" do
    @chef.email = ""
    assert_not @chef.valid?, "email must be present"
  end
  
 
  
  test "email must be valid" do
    valid_addresses = %w[joe@example.com tejst@that.au first.last@inst.hello.org]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, "#{va.inspect} should be valid"
    end
    
    invalid_addresses = %w[joe@example.co+m tejst@that,au first.lastinst.hello.org]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, "#{ia.inspect} should not be valid"
    end
    
  end
  
  
  
   test "email must be unique" do
    @chef.save
    @chef2 = @chef.dup
    assert_not @chef2.valid?, "email not unique"
  end
  
end