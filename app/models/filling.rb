class Filling < ActiveRecord::Base

belongs_to :prescription
belongs_to :pharmacy
belongs_to :user

validates :pharmacy_id, presence: true
validates :prescription_id, presence: true
validates :user_paid, presence: true

accepts_nested_attributes_for :pharmacy, :reject_if => :all_blank

end
