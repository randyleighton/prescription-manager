class Prescription < ActiveRecord::Base

validates :drug_uom, presence: true



belongs_to :drug

end
