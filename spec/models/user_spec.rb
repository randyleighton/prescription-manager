require 'rails_helper'

describe User do
  
  it { should have_many :prescriptions }
  it { should have_many :drugs }
  it { should have_many(:fillings).through(:prescriptions) }  
end 