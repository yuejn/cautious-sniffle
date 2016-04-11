class Contact
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :forename, type: String
  field :surname, type: String
  field :email, type: String
  field :phone, type: String

end
