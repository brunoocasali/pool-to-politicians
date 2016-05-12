class MediaController < ApplicationController
  before_action :set_medium, only: [:edit, :update, :destroy]

  def index
    @media = Medium.page(params[:page])

    respond_with(@media)
  end

  def new
    @medium = Medium.new

    respond_with(@medium)
  end

  def edit; end

  def create
    @medium = Medium.new(medium_params)
    @medium.save

    respond_with(@medium, location: media_url)
  end

  def update
    @medium.update(medium_params)

    respond_with(@medium)
  end

  def destroy
    @medium.destroy

    respond_with(@medium)
  end

  private

  def set_medium
    @medium = Medium.find(params[:id])
  end

  def medium_params
    params.require(:medium).permit(:filename)
  end
end
