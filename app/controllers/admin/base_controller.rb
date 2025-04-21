# Controlador base para administración
class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_user

  layout "admin"

  private

  def ensure_admin_user
    redirect_to root_path, alert: "Acceso no autorizado" unless current_user.admin?
  end
end
