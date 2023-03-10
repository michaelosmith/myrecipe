require "test_helper"

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "John", email: "john@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef name should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname should be max 40" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname should be min 3" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email length should be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_address = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.com.au laura+jake@monk.com]
    valid_address.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_address = %w[user@eee,com user_at_eee.com user.name@example. eee@i_e_.com user@ee+aa.com]
    invalid_address.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end
  
end