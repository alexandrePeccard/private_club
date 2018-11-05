require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(first_name: 'John', last_name: "Doe", email: 'john@example.com')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(first_name: 'John', last_name: 'Doe')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

    test 'invalid without last_name' do
    user = User.new(first_name: "John", email: 'john@example.com')
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:last_name], 'no validation error for name present'
  end

  test 'invalid without first_name' do
    user = User.new(last_name: 'John',  email: 'john@example.com')
    refute user.valid?
    assert_not_nil user.errors[:first_name]
  end
end
