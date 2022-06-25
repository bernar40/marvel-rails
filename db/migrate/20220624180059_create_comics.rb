class CreateComics < ActiveRecord::Migration[7.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :description
      t.datetime :on_sale_date
      t.integer :page_count
      t.string :thumbnail_path
      t.string :thumbnail_extension

      t.timestamps
    end
  end
end
