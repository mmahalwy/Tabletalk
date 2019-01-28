class WelcomeController < ApplicationController
  def index
    redirect_to edit_user_registration_path if @current_user.welcomed?
  end

  def new
    @current_user.welcomed!
    redirect_to edit_user_registration_path
  end
end
