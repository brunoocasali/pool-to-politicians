class DeliveriesController < ApplicationController
  def index
    @delivery = DeliveryForm.new
  end

  def create
  end
end
