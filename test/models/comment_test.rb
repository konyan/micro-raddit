require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name:"nyan" , email: "nyan@gmail.com")
    @post = Post.create(title:"hello world title", body: "this is large body",            user_id:@user.id)
    @comment = Comment.new(text: "greate post",user_id:@user.id, post_id:@post.id)
  end

  test 'comment should be valid' do
    assert @comment.valid?
  end

  test 'comment text should not be blank' do
    @comment.text = " "
    assert_not @comment.valid?
  end

  test "comment text at least 5 charactor" do
    @comment.text = "a" * 4
    assert_not @comment.valid?
  end

end
