require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:contact)).to be_valid
  end
  it "is invalid without a forename"
  it "is invalid without a surname"
  it "is invalid without an email"
  it "is invalid without a phone number"
  it "returns a contact's full name as a string"
end
