# Controlador para el dashboard principal
class Admin::DashboardController < Admin::BaseController
  def index
    @stats = {
      total_users: User.count,
      total_gatos: Gato.count,
      new_users_today: User.where("created_at >= ?", Date.today).count,
      new_gatos_today: Gato.where("created_at >= ?", Date.today).count,
      page_views_today: Event.where(event_type: "page_view").where("created_at >= ?", Date.today).count
    }
  end
end