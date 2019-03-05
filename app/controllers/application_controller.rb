class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_raven_context

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(
        :first_name,
        :last_name,
        :description,
        :city_id,
        :description1,
        interested_in_meeting_list: [],
        timeslot_ids: [],
        confirmations_attributes: [:id, :week_id],
      )
    end
  end

  private

  def set_raven_context
    return unless user_signed_in?

    Raven.user_context(id: current_user.id) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
