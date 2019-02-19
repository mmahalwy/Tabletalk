class Users::RegistrationsController < Devise::RegistrationsController
  def availability
  end

  def about_me
    UserDescription::TYPES_INPUTS.each do |type, input|
      current_user.user_descriptions.first_or_initialize(type: type)
    end

    @user_descriptions = current_user.user_descriptions.enabled
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    request.referrer || edit_user_registration_path
  end

  def after_sign_in_path_for
    availabilities_path
  end

  def after_sign_up_path_for
    availabilities_path
  end
end
