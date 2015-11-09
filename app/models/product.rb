class Product < ActiveRecord::Base
has_many :campaigns
belongs_to :designer
has_attached_file :product_image

end
