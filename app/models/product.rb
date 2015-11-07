class Product < ActiveRecord::Base
<<<<<<< HEAD
has_many :campaigns
belongs_to :designer

=======

  has_attached_file :product_image
>>>>>>> 643b3a7e615d9e15dbe81243d9f959845440475c
end
