class Product < ActiveRecord::Base
  has_many :campaigns
  belongs_to :designer, dependent: :destroy
  has_attached_file :object
  validates_attachment_content_type :object, :content_type=>['application/octet-stream']

  def to_s
    "#{self.name.downcase}"
  end

end
