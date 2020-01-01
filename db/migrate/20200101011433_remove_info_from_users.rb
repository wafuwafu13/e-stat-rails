class RemoveInfoFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :activation_digest, :string
    remove_column :users, :email, :string
    remove_column :users, :password_digest, :string
  end
end
