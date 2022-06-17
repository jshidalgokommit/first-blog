class CreateBloggers < ActiveRecord::Migration[7.0]
  def change
    create_table :bloggers do |t|
      t.string :name
      t.string :last_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
