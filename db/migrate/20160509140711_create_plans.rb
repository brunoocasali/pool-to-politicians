class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :status
      t.integer :kind

      t.timestamps null: false
    end
  end
end
