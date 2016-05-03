class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  def index
    @leads = Lead.all
  end

  def show; end

  def new
    @lead = Lead.new
  end

  def edit; end

  def create
    @lead = Lead.new(lead_params)
    @lead.save

    respond_with @lead, location: leads_path
  end

  def update
    @lead.update(lead_params)

    respond_with @lead, location: leads_path
  end

  def destroy
    @lead.destroy

    respond_with @lead, location: leads_path
  end

  private

  def set_lead
    @lead = Lead.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(:name, :email, :phone, :city, :state, :country, :status)
  end
end
