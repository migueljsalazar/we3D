sclass Customer < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :username, :presence=> true, :length => { :in => 3..20 }
  validates :email, :presence => true, :format => /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  before_save :to_lower
  before_create :to_lower

  def to_lower
    self.username = self.username.downcase
  end

  private

  def username_in_use
    if Designer.where("lower(username) = ?", self.username.downcase).first
      errors.add(:username, "in use")
    elsif Supplier.where("lower(username) = ?", self.username.downcase).first
      errors.add(:username, "in use")
    elsif Customer.where("lower(username) = ?", self.username.downcase).first
    errors.add(:username, "in use")
    end
  end

end
