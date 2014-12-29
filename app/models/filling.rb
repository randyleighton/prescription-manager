class Filling < ActiveRecord::Base

belongs_to :prescription
belongs_to :pharmacy

accepts_nested_attributes_for :pharmacy, :reject_if => :all_blank

end
