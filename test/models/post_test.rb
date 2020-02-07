require 'test_helper'

class PostTest < ActiveSupport::TestCase
   def setup
    @user = User.create(name:"tashfeen",email:"tahsfeen@gamil.com")
    @post = Post.new(title:"my post",body:"i am the post write me",user_id:@user.id)
   end
   test "post should be valid" do
    assert @post.valid?
   end

   test "title can't be blank" do
    @post.title = "  "
    assert_not @post.valid?
   end

   test "body can't be blank" do
     @post.body = " "
     assert_not @post.valid?
   end

   test "title is too long" do
     @post.title = "a" * 301
     assert_not @post.valid?
   end
end
