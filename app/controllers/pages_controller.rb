class PagesController < ApplicationController
  def home
    redirect_to edit_user_registration_path if user_signed_in?
  end

  def letsencrypt
    render text: 'MUOnb5fCHlOVV7k8-5JwX07lQ-D-5kBfnjtez4Rh-_Q.4vp7EAMExQyKHtAy_ilj7Zj-Y6eadc1-ccQsLp23njw'
  end
end
