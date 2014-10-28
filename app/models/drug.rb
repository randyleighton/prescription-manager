class Drug < ActiveRecord::Base

validates :name, presence: true, uniqueness: true
validates :description, presence: true
validates :cost_not_in_dh, presence: true
validates :cost_in_dh, presence: true
validates :bill_to_dh, presence: true


has_many :prescriptions, dependent: :destroy

end

