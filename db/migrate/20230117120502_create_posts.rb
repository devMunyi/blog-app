class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :author, null: false, foreign_key: {table_to: :users}

      t.timestamps
    end
  end
end
