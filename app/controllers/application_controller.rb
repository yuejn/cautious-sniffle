class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def has_tokens?
    if !(ENV["GOOGLE_CLIENT_ID"].present? and ENV["GOOGLE_CLIENT_SECRET"].present?)
      render text: "Please fill out your &lt;GOOGLE_CLIENT_ID&gt; and &lt;GOOGLE_CLIENT_SECRET&gt; tokens in config/application.yml and restart the server."
    end
  end

end