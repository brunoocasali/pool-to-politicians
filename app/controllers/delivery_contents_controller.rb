class DeliveryContentsController < ApplicationController
  before_action :set_delivery_content, only: [:show, :edit, :update, :destroy]

  def index
    @delivery_contents = DeliveryContent.page(params[:page])

    respond_with(@delivery_contents)
  end

  def show
    respond_with(@delivery_content)
  end

  def new
    @delivery_content = DeliveryContent.new

    respond_with(@delivery_content)
  end

  def edit; end

  def create
    @delivery_content = DeliveryContent.new(delivery_content_params)
    @delivery_content.save

    respond_with(@delivery_content)
  end

  def update
    @delivery_content.update(delivery_content_params)

    respond_with(@delivery_content)
  end

  def destroy
    @delivery_content.destroy

    respond_with(@delivery_content)
  end

  private

  def set_delivery_content
    @delivery_content = DeliveryContent.find(params[:id])
  end

  def delivery_content_params
    params.require(:delivery_content).permit(:group_id, :medium_id, :action_url)
  end
end
