class AddBloggerRefToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :blogger, null: false, foreign_key: true
  end
end
