class Prescription < ActiveRecord::Base

validates :drug_uom, presence: true
validates :renewal_interval, presence: true

has_many :prescription_transactions
belongs_to :drug

end
