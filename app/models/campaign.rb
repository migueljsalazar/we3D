class Campaign < ActiveRecord::Base
belongs_to :product
belongs_to :designer
belongs_to :supplier
has_many :orders

end

