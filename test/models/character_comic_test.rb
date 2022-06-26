require 'test_helper'

class CharacterComicTest < ActiveSupport::TestCase
  test 'Validate Two CharacterComic in Fixture' do
    assert_equal 2, CharacterComic.count
  end

  test 'Should not create CharacterComic without character name' do
    assert_raise(ActiveRecord::RecordInvalid) { CharacterComic.create! }
  end

  test 'Should not create CharacterComic without comic foreing key' do
    assert_raise(ActiveRecord::RecordInvalid) { CharacterComic.create!(character_name: 'test') }
  end
end
