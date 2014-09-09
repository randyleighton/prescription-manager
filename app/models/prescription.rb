class Prescription < ActiveRecord::Base

validates :drug_uom, presence: true
validates :renewal_interval, presence: true

belongs_to :drug

end
