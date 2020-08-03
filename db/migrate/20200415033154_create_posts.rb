class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :shop_name
      t.string :nearest
      t.text :content
      t.references :user, foreign_key: true # 自動的にインデックスと外部キー参照付きのuser_idカラムが追加される

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at] # :user_id, :created_atにインデックス付与することで、user_idに関連付けられたすべてのマイクロポストを作成時刻の逆順で取り出しやすくなる
  end
end
