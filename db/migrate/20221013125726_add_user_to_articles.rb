class AddUserToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :Articles,:user_id, :int
  end
end
