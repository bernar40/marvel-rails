# frozen_string_literal: true

class Comic < ApplicationRecord
  has_many :character_comics
  has_many :favorite_comics

  validates :title, presence: true

  scope :favorites, lambda { |user|
    includes(:favorite_comics)
      .where(favorite_comics: { user_id: user.id })
  }

  scope :search, lambda { |hero_name|
    includes(:character_comics)
      .where("lower(character_comics.character_name) = lower('#{hero_name}')")
      .references(:character_comics)
  }

  default_scope -> { order(on_sale_date: :desc, title: :asc) }
end
