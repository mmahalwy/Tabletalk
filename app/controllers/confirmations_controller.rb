class ConfirmationsController < ApplicationController
  before_action :set_confirmation, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:confirm]

  # GET /confirmations
  # GET /confirmations.json
  def index
    @confirmations = Confirmation.all
  end

  # GET /confirmations/1
  # GET /confirmations/1.json
  def show
  end

  # GET /confirmations/new
  def new
    @confirmation = Confirmation.new
  end

  # GET /confirmations/1/edit
  def edit
  end

  # Get /confirmations/confirm?token=TOKEN&week_id=1
  def confirm
    @week = Week.find(params[:week_id])
    @confirmation = @user.confirmations.build(week: @week)

    respond_to do |format|
      if @confirmation.save
        format.html { redirect_to @confirmation, notice: 'You are confirmed for this week!' }
        format.json { render :show, status: :created, location: @confirmation }
      else
        format.html { render :new }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /confirmations
  # POST /confirmations.json
  def create
    @confirmation = Confirmation.new(confirmation_params)

    respond_to do |format|
      if @confirmation.save
        format.html { redirect_to @confirmation, notice: 'Confirmation was successfully created.' }
        format.json { render :show, status: :created, location: @confirmation }
      else
        format.html { render :new }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confirmations/1
  # PATCH/PUT /confirmations/1.json
  def update
    respond_to do |format|
      if @confirmation.update(confirmation_params)
        format.html { redirect_to @confirmation, notice: 'Confirmation was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirmation }
      else
        format.html { render :edit }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmations/1
  # DELETE /confirmations/1.json
  def destroy
    @confirmation.destroy
    respond_to do |format|
      format.html { redirect_to confirmations_url, notice: 'Confirmation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_confirmation
    @confirmation = Confirmation.find(params[:id])
  end

  def set_user
    @user = User.find_by_email_token(params[:token])

    redirect_to root_path, alert: 'You are not authorized' if @user.nil?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def confirmation_params
    params.fetch(:confirmation, {})
  end
end
