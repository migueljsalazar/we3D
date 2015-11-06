class Designer < ActiveRecord::Base
  has_secure_password
  attr_accessor :password

  EMAIL_REGEX = /.+@.+\..+/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create


  def to_s
    "#{first_name} #{last_name}"
  end

end
