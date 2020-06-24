class AddIndexToProject < ActiveRecord::Migration[6.0]
  def change
    add_index :projects, :title, unique: true
  end
end
