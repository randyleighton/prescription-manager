describe Prescription do

  it { should belong_to :user }
  it { should belong_to :drug}
  it { should validate_presence_of :drug_uom }
  it { should validate_presence_of :renewal_interval }

end
