class State < ActiveRecord::Base
  delegate :to_s, to: :name
end
