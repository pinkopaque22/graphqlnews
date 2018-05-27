require 'test-helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, nil)
  end

  test 'creating new user' do
    user = perform(
      name: "test user",
      authProvider: {
        email: {
          email: 'email@exapmple.com',
          password: '[omitted]'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, 'test user'
    assert_equal user.email, 'email@example.com'
  end
end
