class RemovePostReferencesFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :post_references, :string
  end
end
