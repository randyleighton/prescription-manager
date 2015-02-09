class String #this is for terminal colors to spruce things up!
  def black;          "\033[30m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
end

puts ""
# Destroy Existing Data
print "Cleaning Database".magenta
User.destroy_all
print "..."
Prescription.destroy_all
print "..."
Filling.destroy_all
print "..."
Drug.destroy_all
print "..."
Pharmacy.destroy_all
print "..."
Doctor.destroy_all
print "..."
puts "Done.".green

# Create New Data
print "Seeding Database".magenta
user = User.create(email: "test@test.com", name:"Tester", password: "test1234")
print "..."
drug1 = Drug.create(user_id: user.id, name: "Hydrocodone", description:"Narcotic Pain Relief")
drug2 = Drug.create(user_id: user.id, name: "Gabapentin", description: "Pain Inhibitor")
print "..."
doctor1 = Doctor.create(user_id: user.id, name: "Doc McStuffins", practice_name: "Keiser Perm", office_phone: "503-123-4567", email: "docmcstuffins@keiserperm.com")
print "..."
prescription1 = Prescription.create(user_id: user.id, drug_id: drug1.id, drug_uom: "10-325mg", renewal_interval: 1, quantity_prescribed: 100, doctor_id: doctor1.id)
print "..."
prescription2 = Prescription.create(user_id: user.id, drug_id: drug2.id, drug_uom: "600mg", renewal_interval: 3, quantity_prescribed: 90, doctor_id: doctor1.id)
print "..."
pharmacy1 = Pharmacy.create(user_id: user.id, name: "Walgreens", phone: "503-123-4567", url:"http://www.walgreens.com", street: "123 Portland Road", city: "Salem", state:"OR", zip: "97302") 
print "..."
pharmacy2 = Pharmacy.create(user_id: user.id, name: "Rite Aid", phone: "503-234-5678", url:"http://www.riteaid.com", street: "456 5th Ave", city: "Portland", state:"OR", zip: "97342")
print "..."
filling1 = Filling.create(user_id: user.id, prescription_id: prescription1.id, pharmacy_id: pharmacy1.id, date_filled: DateTime.now, medicare_paid: 50, price_paid: 15)
print "..."
filling2 = Filling.create(user_id: user.id, prescription_id: prescription2.id, pharmacy_id: pharmacy2.id, date_filled: DateTime.now, medicare_paid: 15, price_paid: 15)
print "..."
puts "Done.".green
puts "Created " + "#{User.count}".green + " Users,".black +
                  " #{Drug.count}".green + " Drugs,".black +
                  " #{Prescription.count}".green + " Prescriptions,".black +
                  " #{Pharmacy.count}".green + " Pharmacies,".black +
                  " #{Doctor.count}".green + " Doctors,".black +
                  " #{Filling.count}".green + " Fillings".black
puts ""
