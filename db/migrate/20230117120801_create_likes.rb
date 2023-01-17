class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, null: false, foreign_key: {table_to: :users}
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
