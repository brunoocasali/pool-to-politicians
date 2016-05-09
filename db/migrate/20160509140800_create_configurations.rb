class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :from_email
      t.references :plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
