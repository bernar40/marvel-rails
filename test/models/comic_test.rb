require 'test_helper'

class ComicTest < ActiveSupport::TestCase
  test 'Validate Two Comics in Fixture' do
    assert_equal 2, Comic.count
  end

  test 'Should not create comic without title' do
    assert_raise(ActiveRecord::RecordInvalid) { Comic.create! }
  end
end
