describe Drug do

  it { should validate_presence_of :name }
  it { should validate_presence_of :description}
  it { should validate_presence_of :cost_not_in_dh }
  it { should validate_presence_of :cost_in_dh }
  it { should validate_presence_of :bill_to_dh }
  it {should have_many :prescriptions}

  it "should sort drugs alphabetically when calling the scope" do
    drug1 = FactoryGirl.create(:drug, name:"Tizanidine")
    drug2 = FactoryGirl.create(:drug, name:"Hydrocodone")
    expect(Drug.all).to eq [drug1, drug2]
  end

end
