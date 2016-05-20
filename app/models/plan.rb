class Plan < ActiveRecord::Base

  has_enumeration_for :kind, with: PlanKind, required: true
  has_enumeration_for :status, with: CommonStatus, required: true, create_scopes: true
end
