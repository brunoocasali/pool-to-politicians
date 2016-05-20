class AddSubtitleKindAndFeaturedToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :subtitle, :string
    add_column :plans, :featured, :boolean, default: false
  end
end
