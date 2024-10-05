class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não tem permissão para realizar essa ação."
    redirect_to(request.referrer || root_path)
  end

  def authorize_admin!
    redirect_to root_path, alert: "Você não tem permissão para acessar esta página." unless current_user.admin?
  end
end

