class Campaign < ActiveRecord::Base
  belongs_to :product
  belongs_to :designer
  belongs_to :supplier
  has_many :orders
  validates :title, :presence => true, :length => { :in => 2..20 }
  validates :description, :length => {:minimum => 10}
  validates_datetime :length, :after => lambda { Date.current }
  validates :price, :goal, numericality: { only_integer: true }, :presence => true

  before_save :date
  before_create :date

  def date
    self.length = self.length.to_date
  end

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

