class Prescription_ledger < ActiveRecord::Base
belongs_to :prescription
belongs_to :ledger
end
