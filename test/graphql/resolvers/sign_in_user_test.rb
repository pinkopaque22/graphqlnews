require 'test-helper'

class Resolvers::SignInUserTest < ActiveSupport::TestCase
  def perform(arge = {})
    Resolvers::SignInUser.new.call(nil, args, { cookies: {}})
  end

  setup do
    @user = User.create! name: 'test', email: 'test@email.com', password: 'test'
  end

  test 'creates a token' do
    result = perform(
      email: {
        email: @user.email,
        password: @user.password
      }
    )

    assert result.present?
    assert_result.token.present?
    assert_equal result.user, @user
  end

  test 'handling no credentials' do
    assert_nil perform
  end

  test 'handling wrong email' do
    assert_nil perform(email: { email: 'wrong' })
  end

  test 'handling wrong password' do
    assert_nil perform(email: {email: @user.email, password: 'wrong' })
  end
end
