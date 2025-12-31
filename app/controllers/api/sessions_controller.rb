class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:destroy]

  def create
    user = AuthenticateUser.call(
      email: params[:email],
      password: params[:password]
    )

    if user
      sign_in(user)
      render json: session_payload(user), status: :ok
    else
      render json: error_payload, status: :unauthorized
    end
  end

  def destroy
    sign_out(current_user)
    render json: { message: 'Logout successful' }, status: :ok
  end

  private

  def session_payload(user)
    {
      message: 'Login successful',
      user: {
        id: user.id,
        email: user.email
      }
    }
  end

  def error_payload
    { error: 'Invalid email or password' }
  end
end
