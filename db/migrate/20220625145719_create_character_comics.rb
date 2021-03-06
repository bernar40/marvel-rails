# frozen_string_literal: true

class CreateCharacterComics < ActiveRecord::Migration[7.0]
  def change
    create_table :character_comics do |t|
      t.string :character_name, null: false
      t.references :comic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
