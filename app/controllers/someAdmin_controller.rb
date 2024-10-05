class SomeAdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Acesso negado. Você precisa ser um administrador."
    end
  end
end