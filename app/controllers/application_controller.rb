require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :devise_controller?

  layout :layout_by_resource

  respond_to :html, :json

  protected

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
