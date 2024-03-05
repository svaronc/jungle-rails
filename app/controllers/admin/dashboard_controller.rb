class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin

  # Authenticates the admin using HTTP basic authentication with the provided username and password.
  def authenticate_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
  def show
  end
end
