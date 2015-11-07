class Product < ActiveRecord::Base
has_many :campaigns
belongs_to :designer

end
