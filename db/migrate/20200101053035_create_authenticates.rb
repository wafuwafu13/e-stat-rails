class CreateAuthenticates < ActiveRecord::Migration[5.0]
  def change
    create_table :authenticates do |t|
      t.string :password

      t.timestamps
    end
  end
end
