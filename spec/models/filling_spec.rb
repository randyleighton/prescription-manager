describe Filling do

it { should belong_to :prescription }
it { should belong_to :pharmacy }
it { should validate_presence_of :price_paid}

end
