class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true # データベース上でemailを大文字・小文字の違いで区別させないためにインデックスを追加する
  end
end
