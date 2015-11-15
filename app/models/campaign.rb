class Campaign < ActiveRecord::Base
  belongs_to :product
  belongs_to :designer
  belongs_to :supplier
  has_many :orders

  # scope :start, -> {where(start: true)}
  scope :available, -> { where(supplier: nil) }
  scope :unavailable, -> { where.not(supplier: nil) }

  scope :on, -> {where("length >= ?", Date.today)}
  scope :backed, -> {where(status: "backed")}
  scope :off, -> {where("length <= ?", Date.today)}

  # scope :campaign_off, -> { where(length: < Date.now) }

  def available?
    self.supplier.nil?
  end

  def campaign_off
    self.length >= Date.today
  end

   def formatted_price
    price_in_dollars = price.to_f / 100
    format("%.2f", price_in_dollars)
  end


  def profiteq
    profit = ((price - self.product.basecosteq) * goal).to_f / 100
    format("%.2f", profit)
  end

end

