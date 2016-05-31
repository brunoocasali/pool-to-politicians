class RemoveTimestampsFromTables < ActiveRecord::Migration
  def change
    remove_column :cities, :created_at, :datetime
    remove_column :cities, :updated_at, :datetime

    remove_column :states, :created_at, :datetime
    remove_column :states, :updated_at, :datetime

    add_column :delivery_contents, :title, :string
  end
end
