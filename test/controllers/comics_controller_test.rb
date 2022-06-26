require 'test_helper'

class ComicsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
    assert_select 'title', 'Marvel - Rails'
  end

  test 'should get search' do
    get comics_search_path, params: { hero_name: 'Test Hero 1' }
    assert_response :success
  end
end
