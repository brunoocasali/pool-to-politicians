class DeliveriesController < ApplicationController
  def index
    @delivery = DeliveryForm.new
  end

  def find_cities
    cities = City.where(state_id: params[:state_id])

    respond_with(cities)
  end

  def create
    @delivery = DeliveryForm.new(delivery_params)
    # @delivery.create

    respond_with(@delivery)
  end

  private

  def delivery_params
    params.require(:delivery).permit(:state, :city)
  end
end
