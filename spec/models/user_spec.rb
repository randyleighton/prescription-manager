require 'rails_helper'

describe User do
  
#   it { should validate_uniqueness_of :name }
  it { should have_many :prescriptions }
  it { should have_many(:fillings).through(:prescriptions) }  
end 