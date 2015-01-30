class Prescription < ActiveRecord::Base
  
  validates :drug_uom, presence: true
  validates :renewal_interval, presence: true

  has_many :fillings, dependent: :destroy
  has_many :doctors
  belongs_to :drug
  belongs_to :user

  accepts_nested_attributes_for :doctors, :reject_if => :all_blank

  scope :order_by, ->{ joins(:drug).order('drugs.name ASC') }

end
