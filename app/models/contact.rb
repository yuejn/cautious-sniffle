class Contact
  include Mongoid::Document
  field :forename, type: String
  field :surname, type: String
  field :email, type: String
  field :phone, type: String
end
