require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get sign_up_path
    assert_response :success
  end

  test 'should post create' do
    post sign_up_path, params: { user: { email: 'test3@test.com',
                                         password: BCrypt::Password.create('abcdef').to_s,
                                         password_confirmation: BCrypt::Password.create('abcdef').to_s } }
    assert_response :success
  end
end
