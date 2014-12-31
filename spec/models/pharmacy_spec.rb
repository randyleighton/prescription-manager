describe Pharmacy do

it { should have_many :fillings }
it { should validate_presence_of :name }

it "should add http:// to url if missing" do
  pharmacy = Pharmacy.create(name:"Walgreens", url:"www.nachos.com")
  expect(pharmacy.url).to eq "http://www.nachos.com"
end




end