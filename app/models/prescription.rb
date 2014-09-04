class Prescription < ActiveRecord::Base

validates :drug_uom, presence: true
validates :quantity, presence: true



belongs_to :drug

end
