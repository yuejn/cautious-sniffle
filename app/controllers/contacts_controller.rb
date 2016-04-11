class ContactsController < ApplicationController
  def welcome

  end

  def index
  end

  def show
  end

  def import
    render text: request.env["omniauth.auth"].to_yaml
  end
end