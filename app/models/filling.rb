class Filling < ActiveRecord::Base

belongs_to :prescription
belongs_to :pharmacy
belongs_to :user

accepts_nested_attributes_for :pharmacy, :reject_if => :all_blank

end
