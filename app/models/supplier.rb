class Supplier < ActiveRecord::Base
  has_secure_password
  has_many :campaigns
  has_many :orders, through: :campaigns

  validates :username, :presence => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :format => /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  validate :username_in_use

  before_save :to_lower
  before_create :to_lower

  def to_lower
    self.username = self.username.downcase
  end

  private

  def username_in_use
    if Supplier.where("lower(username) = ?", self.username.downcase).first
      errors.add(:username, "in use")
    end
  end

end
