describe Drug do

  it { should validate_presence_of :name }
  it { should validate_presence_of :description}
  it {should have_many :prescriptions}

  it "should sort drugs alphabetically when calling the scope" do
    drug1 = FactoryGirl.create(:drug, name:"Tizanidine")
    drug2 = FactoryGirl.create(:drug, name:"Hydrocodone")
    expect(Drug.all).to eq [drug1, drug2]
    expect(Drug.all.order_by).to eq [drug2,drug1]
  end

end
