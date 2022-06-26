require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Validate Two Users in Fixture' do
    assert_equal 2, User.count
  end

  test 'Should not create user without email' do
    assert_raise(ActiveRecord::RecordInvalid) { User.create! }
  end

  test 'Should not create user without password' do
    assert_raise(ActiveRecord::RecordInvalid) { User.create!(email: 'test3@test.com') }
  end

  test 'Should not create user without valid email' do
    assert_raise(ActiveRecord::RecordInvalid) { User.create!(email: 'test3', password_digest: 'password') }
  end
end
