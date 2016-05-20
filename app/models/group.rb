class Group < ActiveRecord::Base
  belongs_to :configuration, dependent: :destroy

  validates :configuration, presence: true
end
