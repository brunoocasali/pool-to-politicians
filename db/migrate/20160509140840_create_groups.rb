class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.references :configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
