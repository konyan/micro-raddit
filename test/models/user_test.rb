require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name:"Nyan", email:"nyan@gmail.com")
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'name can\'t be blank' do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should be at least 20 charactor" do
    @user.name = "a" * 21
    assert_not @user.valid?
  end

  test 'email can\'t be blank' do
    @user.email = " "
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = "b" * 256
    assert_not @user.valid?
  end

  test 'email validation should be valid address' do
    valid_address = %w[exmaple@gmail.com User@Foo.Com A_Us-ER@foo.bar.org nyan.goo@Foo.jp alice+boo@gg.zom]

    valid_address.each do |address|
      @user.email = address
      assert @user.valid?
    end
  end

  test 'email validation check for invalid address' do
    valid_address = %w[exmaple User.Com A_Us-ER_foo.bar.org nyan.goo-Foo.jp alice+boo-gg.zom]

    valid_address.each do |address|
      @user.email = address
      assert_not @user.valid?
    end
  end

  test "email unique check" do
    dup_user = @user.dup
    dup_user.email = @user.email.downcase
    @user.save
    assert_not dup_user.valid?
  end

  test "email address should save with lower-case" do
    mixed_email = "Fooo@FOo.com"
    @user.email = mixed_email
    @user.save
    assert_equal mixed_email.downcase, @user.reload.email
  end

end
