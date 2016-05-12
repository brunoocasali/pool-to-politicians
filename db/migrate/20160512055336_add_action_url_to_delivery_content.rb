class AddActionUrlToDeliveryContent < ActiveRecord::Migration
  def change
    add_column :delivery_contents, :action_url, :string
  end
end
