class AddImageandIntroductionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :users, :introduction, :string
  end
end
