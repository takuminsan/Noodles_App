class CreatePostCategoryRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :post_category_relations do |t|
      t.references :post, foreign_key: true # 自動的にインデックスと外部キー参照付きのpost_idカラムが追加される
      t.references :category, foreign_key: true # 自動的にインデックスと外部キー参照付きのpost_idカラムが追加される

      t.timestamps
    end
  end
end
