class Product < ActiveRecord::Base
  has_many :campaigns, dependent: :destroy
  belongs_to :designer
  has_attached_file :object
  validates_attachment_content_type :object, :content_type=>['application/octet-stream']

  def to_s
    "#{self.name.downcase}"
  end

  def basecosteq
    basecost = (((x.to_f / 10) * (y.to_f / 10) * (z.to_f / 10 )) /10) * 1.5
    format("%.2f", basecost)
  end

end
