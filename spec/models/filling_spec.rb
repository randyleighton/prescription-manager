describe Filling do

it { should belong_to :prescription }
it { should belong_to :pharmacy }
it { should validate_presence_of :user_paid}
it { should validate_presence_of :pharmacy_id }
it { should validate_presence_of :prescription_id }

end
