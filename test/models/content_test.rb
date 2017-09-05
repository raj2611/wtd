require 'test_helper'
class ContentTest < ActiveSupport::TestCase
	 def setup
	 	@user = User.create(username: "sumant raj",email: "name@example.com")
	 	@content = @user.contents.build(name: "chicken Kabab",summary: "this is a nice meal",description: "add oil,add onion,add sauce,add masala,add chicken,fry for 20min, cook with water for 10min")
	 end

	 test "content should be valid" do 
	 	assert @content.valid?
	 end 
	 test "user id should be present" do
	 @content.user_id =nil
	 assert_not @content.valid?
	end
     test "name should be present" do
     	@content.name=" "
     	assert_not @content.valid?
     end
     test "name should not be too long" do
     	@content.name = "a" * 101
     	assert_not @content.valid?
     end
     test "name should not be short" do
     	@content.name = "aaaa"
     	assert_not @content.valid?
     end 
     test "summary should be present" do
     	@content.summary=" "
     	assert_not @content.valid?
     end
     test "summary should not be too long" do
     	@content.summary = "a" * 501
     	assert_not @content.valid?
     end
     test "summary should not be short" do
     	@content.summary = "a" * 9
     	assert_not @content.valid?
     end 
	 test "description should be present" do
     	@content.description=" "
     	assert_not @content.valid?
     end
     test "description should not be too long" do
     	@content.description = "a" * 10001
     	assert_not @content.valid?
     end
     test "description should not be short" do
     	@content.description = "a" * 49
     	assert_not @content.valid?
     end 

end