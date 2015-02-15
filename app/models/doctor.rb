class Doctor < ActiveRecord::Base

  has_many :prescriptions, dependent: :destroy

end