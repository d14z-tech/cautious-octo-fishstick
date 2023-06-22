class Api::V1::UsersController < ApplicationController
  before_action :authenticate!, only: :logout

  # POST /api/v1/sign_up
  # POST /api/v1/sign_up.json
  def create
    @user = User.new(signup_params)

    if @user.save
      response.headers['Token'] = @user.token

      render status: :created
    else
      render json: { status: 'fail', data: { user: @user.errors.to_hash(true) } }, status: :unprocessable_entity
    end
  end

  # POST /api/v1/sign_in
  # POST /api/v1/sign_in.json
  def sign_in
    @user = User.find_by(email: signin_params[:email])

    if @user&.authenticate(signin_params[:password])
      response.headers['Token'] = @user.token
    else
      render json: { status: 'fail', data: { user: { base: ['Your email or password is incorrect'] } } }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/logout
  # DELETE /api/v1/logout.json
  def logout
    if Current.user.regenerate_token
      head :no_content
    else
      render json: { status: 'fail', data: { user: Current.user.errors.to_hash(true) } }, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def signup_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def signin_params
      params.require(:user).tap do |required_params|
        required_params.require(:email)
        required_params.require(:password)
      end
    end
end
