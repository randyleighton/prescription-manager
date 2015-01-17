FactoryGirl.define do

  factory :drug do
    name "Norco"
    description "Hydrocodone for Pain"
    user_id 1
  end

  factory :prescription do
    drug_id 1
    drug_uom "10-325mg"
    renewal_interval 3
    quantity_prescribed 100
    user_id 1
  end

  factory :pharmacy do
    name Faker::Internet.user_name
    phone Faker::PhoneNumber.phone_number
    street Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip
    url Faker::Internet.url
    user_id 1
  end

  factory :filling do
    prescription_id 1
    date_filled DateTime.now
    price_paid 10
    medicare_paid 10
    pharmacy_id 1
    user_id 1
  end

end