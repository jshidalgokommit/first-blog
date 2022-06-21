class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :followed_user, index: true, null: false, foreign_key: { to_table: :users }
      t.references :followed_by_user, index: true, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
