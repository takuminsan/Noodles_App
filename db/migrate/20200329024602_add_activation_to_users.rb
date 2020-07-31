class AddActivationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean, default: false # デフォルトでは有効化されていないということを示すため、default: false引数を与える
    add_column :users, :activated_at, :datetime
  end
end
