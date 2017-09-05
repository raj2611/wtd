require 'test_helper'
class UserTest < ActiveSupport::TestCase
	 def setup
	 	@user = User.new(username: "sumant raj",email: "name@emample.com")
	 end

	 test "user should be valid" do 
	 	assert @user.valid?
	 end 
     test "username should be present" do
     	@user.username=" "
     	assert_not @user.valid?
     end
     test "username should not be too long" do
     	@user.username = "a" * 101
     	assert_not @user.valid?
     end
     test "username should not be short" do
     	@user.username = "aaaa"
     	assert_not @user.valid?
     end 
     test "email should be present" do
     	@user.email=" "
     	assert_not @user.valid?
     end
     test "email should not be within bounds" do
     	@user.email = "a" * 101 + "@example.com"
     	assert_not @user.valid?
     end
     test "email address should be unique" do
          dup_user = @user.dup
          dup_user.email = @user.email.upcase
          @user.save
          assert_not dup_user.valid?
     end
     test "email validation should accept valid addresses" do
          valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.ogr user@example.com first.last@eem.au laura+jaa@monk.cm]
          valid_addresses.each do |va|
               @user.email =va
               assert @user.valid?, '#{va.inspect} should be valid'
               end
     end
     test "email validation accept reject invalid address" do
          invalid_addresses = %w[user@exam,com user_att_eee.org user.name@example. eee@i_am.com foo@ee+aar.com]
          invalid_addresses.each do |ia|
               @user.email = ia
               assert_not @user.valid?, '#{ia.inspect} should be invalid'
                end
     end

end