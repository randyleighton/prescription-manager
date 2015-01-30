describe Prescription do

  it { should belong_to :user }
  it { should belong_to :drug }
  it { should belong_to :doctor }
  it { should have_many :fillings }

  it { should validate_presence_of :drug_uom }
  it { should validate_presence_of :renewal_interval }

  let!(:drug1) { drug1 = FactoryGirl.create(:drug, name:"Tizanidine") }
  let!(:drug2) { drug2 = FactoryGirl.create(:drug, name:"Hydrocodone") }
  let!(:prescription1) { prescription1 = FactoryGirl.create(:prescription, drug_id: drug1.id) }
  let!(:prescription2) { prescription2 = FactoryGirl.create(:prescription, drug_id: drug2.id) }

  describe "scope sorting" do
    it "display the drug name through the active record relation" do
      expect(prescription1.drug.name).to eq "Tizanidine"
    end
    it "should sort prescriptions by drug name order" do
      expect(Prescription.all.order_by). to eq [prescription2, prescription1]
    end
  end



end
