class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with username: "jungle", password: "book"
  def show
  end
end
