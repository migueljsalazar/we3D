class Product < ActiveRecord::Base
  has_many :campaigns
  belongs_to :designer
  has_attached_file :product_image
  do_not_validate_attachment_file_type :product_image
end
