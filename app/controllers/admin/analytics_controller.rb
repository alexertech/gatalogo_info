# Controlador de analíticas
class Admin::AnalyticsController < Admin::BaseController
  def index
    # Vista general de analíticas
  end

  def page_views
    # Prepara datos para gráfico de vistas de página
    @daily_views = Event.where(event_type: "page_view")
                        .where("created_at >= ?", 30.days.ago)
                        .group("DATE(created_at)")
                        .count

    @popular_pages = Event.where(event_type: "page_view")
                          .where("created_at >= ?", 30.days.ago)
                          .group("metadata->>'path'")
                          .count
                          .sort_by { |_, count| -count }
                          .first(10)
  end

  def gato_popularity
    # Prepara datos para popularidad de razas de gatos
    @popular_gatos = Event.where(event_type: "gato_view")
                          .where("created_at >= ?", 30.days.ago)
                          .joins("JOIN gatos ON gatos.id = CAST(events.metadata->>'gato_id' AS INTEGER)")
                          .group("gatos.name")
                          .count
                          .sort_by { |_, count| -count }
                          .first(10)
  end

  # Otros métodos de analíticas...
end
