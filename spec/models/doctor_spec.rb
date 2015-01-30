describe Doctor do

it { should have_many :prescriptions }

it "should create a doctor instance with FactoryGirl" do
  FactoryGirl.create(:doctor)
  expect(Doctor.count).to eq 1
end

end