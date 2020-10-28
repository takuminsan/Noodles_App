class RenameCategoryIdColumnToPostGenreRelations < ActiveRecord::Migration[6.0]
  def change
    rename_column :post_genre_relations, :category_id, :genre_id
  end
end
