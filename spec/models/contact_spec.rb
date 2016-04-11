require 'rails_helper'

RSpec.describe Contact, type: :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:contact)).to be_valid
  end

  it "is invalid without a forename" do
    expect(FactoryGirl.build(:contact, forename: nil)).to_not be_valid
  end 

  it "is invalid without a surname" do
    expect(FactoryGirl.build(:contact, surname: nil)).to_not be_valid
  end 

  it "is invalid without an email" do
    expect(FactoryGirl.build(:contact, email: nil)).to_not be_valid
  end 

  it "is invalid without a phone number" do
    expect(FactoryGirl.build(:contact, phone: nil)).to_not be_valid
  end 

  it "returns a contact's full name as a string"
end
