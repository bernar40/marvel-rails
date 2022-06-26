# frozen_string_literal: true

class CharacterComic < ApplicationRecord
  belongs_to :comic

  validates :character_name, presence: true
end
