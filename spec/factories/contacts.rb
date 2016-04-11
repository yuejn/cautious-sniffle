require "faker"

FactoryGirl.define do
  factory :contact do |contact|
    contact.forename { Faker::Name.first_name }
    contact.surname { Faker::Name.last_name }
    contact.email { Faker::Internet.email }
    contact.phone { Faker::PhoneNumber.cell_phone}
  end
end
