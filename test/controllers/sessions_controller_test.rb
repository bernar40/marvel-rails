require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should post create' do
    user = users(:one)
    post log_in_path, params: { email: user.email, password: user.password }
    assert_response :success
  end
end
