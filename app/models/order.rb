class Order < ActiveRecord::Base
  belongs_to :campaigns
  belongs_to :customer
end
