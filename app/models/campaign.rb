class Campaign < ActiveRecord::Base
  belongs_to :product
  belongs_to :designer
  belongs_to :supplier
  has_many :orders

  # scope :start, -> {where(start: true)}
  scope :available, -> { where(supplier: nil) }
  scope :unavailable, -> { where.not(supplier: nil) }

  scope :on, -> {where(status: "on")}
  scope :backed, -> {where(status: "backed")}
  scope :off, -> {where("length >= ?", Date.today)}

  # scope :campaign_off, -> { where(length: < Date.now) }

  def available?
    self.supplier.nil?
  end

  # def campaign_off
  #   self.length >= Date.time?
  # end

end

