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
  scope :off, -> {where(status: "off")}

  def available?
    self.supplier.nil?
  end

end

