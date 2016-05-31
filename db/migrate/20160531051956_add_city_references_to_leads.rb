class AddCityReferencesToLeads < ActiveRecord::Migration
  def change
    add_reference :leads, :city, index: true, foreign_key: true
  end
end
