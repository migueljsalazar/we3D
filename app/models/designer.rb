class Designer < ActiveRecord::Base
  has_secure_password
  has_many :products
  has_many :campaigns, through: :products

  validates :username, :presence => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :format => /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

end
