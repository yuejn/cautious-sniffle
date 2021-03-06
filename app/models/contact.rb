class Contact
  include Mongoid::Document
  include Mongoid::Timestamps

  field :forename, type: String
  field :surname, type: String
  field :email, type: String
  field :phone, type: String

  # Validations

  validates_presence_of :forename
  validates_presence_of :surname
  validates_presence_of :email
  validates_presence_of :phone

  # Scope

  default_scope { order("surname ASC") }

  # Output

  def full_name
    [forename, surname].join " "
  end

end