class Campaign < ActiveRecord::Base
belongs_to :product
belongs_to :designer
belongs_to :supplier
has_many :orders

scope :active, -­> { where(active: true) }
scope :cohort, ­->(cohort_num) { where(cohort: cohort_num) }
scope :active_cohort, ­->(cohort_num) { active.cohort cohort_num }

scope :start, -> {where(start: true)}
scope :available, -> {where(available: true)}
scope :on, -> {where(status: "on")}
scope :backed, -> {where(status: "backed")}
scope :off, -> {where(status: "off")}

end

