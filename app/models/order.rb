class Order < ActiveRecord::Base
  belongs_to :campaigns
  belongs_to :customer
  belongs_to :supplier

  def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: @customer.id,
                          amount: @campaign.price * 100,
                          description: @camgpaign.title,
                          currency: 'usd'

  end
end

