# frozen_string_literal: true

class Comic < ApplicationRecord
  has_many :character_comics
  has_many :favorite_comics

  validates :title, presence: true
end
