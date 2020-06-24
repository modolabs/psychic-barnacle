class AddDeletedToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :deleted, :boolean, null: false, default: false
  end
end
