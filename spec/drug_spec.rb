require 'rails_helper'

describe Drug do

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :description}
  it { should validate_presence_of :cost_not_in_dh }
  it { should validate_presence_of :cost_in_dh }
  it { should validate_presence_of :bill_to_dh }

  it {should have_many :prescriptions}


end
