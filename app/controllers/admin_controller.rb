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
    @sections = Section.all
    @users = User.all
    @courses = Course.all
  end
end
