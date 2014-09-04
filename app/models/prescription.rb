class Prescription < ActiveRecord::Base

validates :drug_uom, presence: true
validates :quantity, presence: true
validates :cost_not_in_dh, presence: true
validates :cost_in_dh, presence: true
validates :bill_to_dh, presence: true
validates :date, presence: true

belongs_to :drug

end
