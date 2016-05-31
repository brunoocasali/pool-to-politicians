class DeliveryForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :state, :city, :delivery_content, :leads

  validates :state, :city, :delivery_content, presence: true

  def self.model_name
    ActiveModel::Name.new self, nil, 'Delivery'
  end
end
