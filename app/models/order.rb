class Order < ActiveRecord::Base
  belongs_to :campaigns
  belongs_to :customer
  belongs_to :supplier
end
