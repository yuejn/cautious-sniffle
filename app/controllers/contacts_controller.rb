class ContactsController < ApplicationController

  def welcome
  end

  def index
  end

  # show individual contact
  def show
  end

  # create the session
  def create_session
  end

  # pull the spreadsheet
  def authenticate

    @user = request.env["omniauth.auth"]["info"]
    credentials = request.env["omniauth.auth"]["credentials"]

    # initialise Google Drive module w/OAuth details
    session = GoogleDrive.login_with_oauth(credentials["token"])

    # get list of spreadsheets
      # https://developers.google.com/drive/v2/reference/files/list
    @spreadsheets = session.spreadsheets(corpus: "DEFAULT", maxResults: 5, orderBy: "modifiedByMeDate desc")

    respond_to do |format|
      format.html
    end

    # user["name"]
#    render text: request.env["omniauth.auth"].to_yaml
    
 #   byebug

  end
end