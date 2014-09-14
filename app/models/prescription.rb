class Prescription < ActiveRecord::Base

  validates :drug_uom, presence: true
  validates :renewal_interval, presence: true
  
  has_many :ledger_prescriptions
  belongs_to :drug
  belongs_to :user

end
