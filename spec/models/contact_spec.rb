require 'rails_helper'

RSpec.describe Contact, type: :model do

  it "has a valid factory" do
    expect(build(:contact, forename: "Jon", surname: "Snow", email: "jon@stark.co.uk", phone: "1-222-1456")).to be_valid
  end

  it "is invalid without a forename" do
    expect(build(:contact, forename: nil)).to_not be_valid
  end

  it "is invalid without a surname" do
    expect(build(:contact, surname: nil)).to_not be_valid
  end 

  it "is invalid without an email" do
    expect(build(:contact, email: nil)).to_not be_valid
  end 

  it "is invalid without a phone number" do
    expect(build(:contact, phone: nil)).to_not be_valid
  end

  it "returns a contact's full name as a string" do 
    contact = build(:contact, forename: "Jon", surname: "Snow")
    expect(contact.full_name).to eq("Jon Snow")
  end

end