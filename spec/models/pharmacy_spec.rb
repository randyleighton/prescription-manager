describe Pharmacy do

it { should have_many :fillings }
it { should validate_presence_of :name }
it { should validate_uniqueness_of :name }

end