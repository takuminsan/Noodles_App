class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false # デフォルトでは管理者になれないということを示すため、default: false引数を与える
  end
end
