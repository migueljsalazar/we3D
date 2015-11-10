class Product < ActiveRecord::Base
has_many :campaigns
belongs_to :designer
has_attached_file :product_image
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
