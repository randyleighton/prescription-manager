describe Pharmacy do

it { should have_many :fillings }
it { should validate_presence_of :name }

it "should add http:// to url if missing" do
  pharmacy = Pharmacy.create(name:"Walgreens", url:"www.nachos.com")
  expect(pharmacy.url).to eq "http://www.nachos.com"
end

  it "should sort drugs alphabetically when calling the scope" do
    pharmacy1 = FactoryGirl.create(:pharmacy,name:"Walgreens")
    pharmacy2 = FactoryGirl.create(:pharmacy,name:"RiteAid")
    expect(Pharmacy.all).to eq [pharmacy1, pharmacy2]
    expect(Pharmacy.all.order_by).to eq [pharmacy2,pharmacy1]
  end



end