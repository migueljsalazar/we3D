class WelcomeController < ApplicationController
  def index
    @campaigns = Campaign.unavailable.on
  end
end
