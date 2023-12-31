class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers # <-- This!

  # ...

  helper_method :current_user

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user
    redirect_to users.sign_in_path, alert: "You need to sign in to see members only content."
  end
end
