class Prescription < ActiveRecord::Base
  
  validates :drug_uom, presence: true
  validates :renewal_interval, presence: true

  has_many :fillings, dependent: :destroy
  belongs_to :doctor
  belongs_to :drug
  belongs_to :user

  accepts_nested_attributes_for :doctor, :reject_if => :all_blank
  accepts_nested_attributes_for :drug, :reject_if => :all_blank

  scope :order_by, ->{ joins(:drug).order('drugs.name ASC') }

end
