class AddBodyToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :body, :string
    add_column :articles, :subtitle, :string
  end
end
