class LedgerPrescription < ActiveRecord::Base

  belongs_to :prescription
  belongs_to :ledger

end
