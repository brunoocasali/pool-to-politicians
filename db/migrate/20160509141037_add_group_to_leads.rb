class AddGroupToLeads < ActiveRecord::Migration
  def change
    add_reference :leads, :group, index: true, foreign_key: true
  end
end
