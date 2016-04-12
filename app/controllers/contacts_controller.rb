class ContactsController < ApplicationController

  before_action :set_spreadsheet_key, only: [:import]
  before_action :set_contact, only: [:show]
  before_action :has_tokens?

  # show imported documents/contacts
  def index
    @contacts = Contact.all

    if @contacts.count == 0
      render text: "No contacts. You should import them..."
    end

  end

  # show individual contact
  def show
  end

  # import from spreadsheet
  def import

    @session = GoogleDrive.login_with_oauth(session[:access_token])

    @spreadsheet = @session.spreadsheet_by_key(@key).worksheets[0]

      @spreadsheet.rows.drop(1).each do |row|
        Contact.create(
          forename: row[0],
          surname: row[1],
          email: row[2],
          phone: row[3]
        )
      end

      respond_to do |format|
        format.html
      end

  end

  # pull applicable spreadsheets
  def authenticate

    if request.env["omniauth.auth"].present?

      session[:access_token] = request.env["omniauth.auth"]["credentials"]["token"]

      @user = request.env["omniauth.auth"]["info"]
      credentials = request.env["omniauth.auth"]["credentials"]

      # initialise Google Drive module with OAuth details
      @session = GoogleDrive.login_with_oauth(session[:access_token])

      # get list of spreadsheets
      @spreadsheets = @session.spreadsheets(corpus: "DEFAULT", maxResults: 5, orderBy: "modifiedByMeDate desc")

      respond_to do |format|
        format.html
      end

    else
      render text: "Woops, authorisation failed."
    end

  end


  private

  def set_spreadsheet_key
    @key = params[:key]
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

end