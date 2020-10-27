class ChangeCategoryToGenre < ActiveRecord::Migration[6.0]
  def change
    rename_table :categories, :genres
    rename_table :post_category_relations, :post_genre_relations
  end
end
