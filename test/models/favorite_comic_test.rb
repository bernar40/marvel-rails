require 'test_helper'

class FavoriteComicTest < ActiveSupport::TestCase
  test 'Validate Two FavoriteComic in Fixture' do
    assert_equal 2, FavoriteComic.count
  end

  test 'Should not create FavoriteComic without foreing keys' do
    assert_raise(ActiveRecord::RecordInvalid) { FavoriteComic.create! }
  end

  test 'Should not create FavoriteComic without comic foreing key' do
    assert_raise(ActiveRecord::RecordInvalid) { FavoriteComic.create!(user: users(:one)) }
  end

  test 'Should not create FavoriteComic without user foreing key' do
    assert_raise(ActiveRecord::RecordInvalid) { FavoriteComic.create!(comic: comics(:one)) }
  end
end
