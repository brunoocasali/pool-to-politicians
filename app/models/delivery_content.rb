class DeliveryContent < ActiveRecord::Base
  belongs_to :group
  belongs_to :medium

  validates :group, presence: true
  validates :title, presence: true
  validates :medium, presence: true
  validates :action_url, presence: true, format: URI::regexp(%w(http https))
end
