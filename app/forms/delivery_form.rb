class DeliveryForm
  include ActiveModel::Model

  attr_accessor :state, :city, :delivery_content, :leads

  def self.model_name
    ActiveModel::Name.new self, nil, 'Delivery'
  end
end
