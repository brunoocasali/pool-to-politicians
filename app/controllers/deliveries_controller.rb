class DeliveriesController < ApplicationController
  def index
    @delivery = DeliveryForm.new
  end

  def find_cities
    cities = City.where(state_id: params[:state_id])

    respond_with(cities)
  end

  def preview
    @delivery = DeliveryForm.new(delivery_params)
    @delivery.calc_values

    respond_with(@delivery, location: deliveries_path)
  end

  def create
    @delivery = DeliveryForm.new(delivery_params)
    @delivery.calc_values

    @job = Delayed::Job.enqueue MailerJob.new(@delivery, @delivery.leads.count)
  end

  private

  def delivery_params
    params.require(:delivery).permit(:state, :city, :delivery_content)
  end
end
