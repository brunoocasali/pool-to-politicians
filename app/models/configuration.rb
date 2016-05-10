class Configuration < ActiveRecord::Base
  belongs_to :plan

  validates :plan, presence: true
end
