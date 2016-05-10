class Group < ActiveRecord::Base
  belongs_to :configuration

  validates :configuration, presence: true
end
