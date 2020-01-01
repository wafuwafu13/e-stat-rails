class RemoveLoginFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :activated, :boolean
    remove_column :users, :activated_at, :datetime
    remove_column :users, :admin, :boolean
    remove_column :users, :remember_digest, :string
  end
end
