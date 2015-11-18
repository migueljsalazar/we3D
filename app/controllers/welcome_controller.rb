class WelcomeController < ApplicationController
  def index
    @campaigns = Campaign.unavailable.on

    @popular_campaign = @campaigns.first # TODO: implement popular
  end
end
