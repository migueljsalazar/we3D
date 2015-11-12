class Product < ActiveRecord::Base
  has_many :campaigns
  belongs_to :designer
  has_attached_file :object
  validates_attachment_content_type :object, :content_type=>['application/octet-stream']
end
