class DeliveryForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :state, :city, :delivery_content, :leads

  validates :state, :city, :delivery_content, presence: true
  validates :leads, length: { minimum: 1, message: 'deve possuir no mínimo 1 lead selecionado.' }

  def initialize(params = {})
    super(params)

    @leads = []
  end

  def medium
    DeliveryContent.find(delivery_content).medium
  end

  def use_delivery_content
    DeliveryContent.find(delivery_content)
  end

  def calc_values
    @leads = Lead.where(city: city)
  end

  def self.model_name
    ActiveModel::Name.new self, nil, 'Delivery'
  end
end
