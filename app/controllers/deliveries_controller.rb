class DeliveriesController < ApplicationController
  def find_cities
    cities = City.where(state_id: params[:state_id])

    respond_with(cities)
  end

  def new
    @delivery = DeliveryForm.new
  end

  def preview
    @delivery = DeliveryForm.new(delivery_params)
    @delivery.calc_values

    respond_with(@delivery, location: deliveries_path)
  end

  def create
    @delivery = DeliveryForm.new(delivery_params)
    @delivery.calc_values
    @delivery.valid?

    Delayed::Job.enqueue(MailerJob.new(@delivery.use_delivery_content.id, @delivery.leads))

    respond_with(@delivery, location: new_delivery_path, notice: 'Seus emails já estão na fila para envio!')
  end

  private

  def delivery_params
    params.require(:delivery).permit(:state, :city, :delivery_content)
  end
end
