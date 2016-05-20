class HomeController < ApplicationController
  def index
    @plans = Plan.active
  end
end
