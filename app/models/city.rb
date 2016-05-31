class City < ActiveRecord::Base
  belongs_to :state

  delegate :to_s, to: :name
end
