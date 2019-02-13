class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :set_user, only: [:approve]
  before_action :set_week, only: %i[week meetings]

  def users
    @users = User.includes(:city).accessible_by(current_ability)
  end

  def weeks
    @weeks = Week.all
  end

  def timeslots
    @timeslots = Timeslot.unscoped.all
  end

  def timeslot
    @timeslot = Timeslot.unscoped.find(params[:id])
  end

  def week; end

  def create_week_and_send_confirmations
    Weekly::CreateWeekAndSendConfirmationsJob.perform_later

    redirect_to admin_weeks_path
  end

  def create_meetings
    Weekly::CreateMeetingsJob.perform_later

    redirect_to admin_weeks_path
  end

  def meetings
    @meetings = @week.meetings
  end

  def approve
    @user.approve!

    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_week
    @week = Week.includes([
      :user_meetings,
      { confirmations: { user: [:timeslots, :city] } }
    ]).find(params[:id])
  end

  def is_admin?
    @current_user.admin? || Rails.env.development?
  end
end
