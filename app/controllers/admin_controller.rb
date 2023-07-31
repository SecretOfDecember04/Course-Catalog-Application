class AdminController < ApplicationController
  def dashboard
    # Your admin dashboard logic here
  end

  def users
    # Logic to display a list of users in the admin panel
    @users = User.all
  end

  def index
    @applications = Application.all
  end
end
