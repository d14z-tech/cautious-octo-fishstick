class Api::V1::UsersController < ApplicationController
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

  private
    # Only allow a list of trusted parameters through.
    def signup_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
