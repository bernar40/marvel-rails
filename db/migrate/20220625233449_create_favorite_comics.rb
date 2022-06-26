class CreateFavoriteComics < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_comics do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
