class Doctor < ActiveRecord::Base

  has_many :prescriptions

end