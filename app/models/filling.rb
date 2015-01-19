class Filling < ActiveRecord::Base

belongs_to :prescription
belongs_to :pharmacy
belongs_to :user

validates :prescription_id, presence: true
validates :price_paid, presence: true

accepts_nested_attributes_for :pharmacy, :reject_if => :all_blank

end
