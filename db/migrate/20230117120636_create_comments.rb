class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :author, null: false, foreign_key: true
      t.string :post_references

      t.timestamps
    end
  end
end
