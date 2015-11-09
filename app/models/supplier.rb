class Supplier < ActiveRecord::Base
  has_secure_password
  has_many :campaigns
  validate :username_in_use

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
    end
  end

end
