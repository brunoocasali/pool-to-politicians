class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email, unique: true
      t.string :phone
      t.string :city
      t.string :state
      t.string :country
      t.integer :status

      t.timestamps null: false
    end

    add_index :leads, :status
  end
end
