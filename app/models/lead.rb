class Lead < ActiveRecord::Base
  belongs_to :city

  # validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_enumeration_for :status, with: CommonStatus, required: true
end
