require 'ostruct'

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
    
    # Calcular los gatos más populares basados en las visitas a páginas
    # Las visitas a los gatos se registran como eventos 'page_view' con una URL como "/es/gatos/123" o "/en/gatos/123"
    gato_views = {}
    
    Event.where(event_type: "page_view").each do |event|
      path = event.metadata&.dig("path")
      next unless path
      
      # Extractar el ID del gato desde la ruta con patrón "/xx/gatos/123"
      match = path.match(%r{/(?:[a-z]{2}/)?gatos/(\d+)})
      next unless match
      
      gato_id = match[1].to_i
      gato_views[gato_id] ||= 0
      gato_views[gato_id] += 1
    end
    
    # Obtener información de los 5 gatos más populares
    top_gato_ids = gato_views.sort_by { |_id, count| -count }.take(5).map(&:first)
    gatos_by_id = Gato.where(id: top_gato_ids).index_by(&:id)
    
    @popular_gatos = top_gato_ids.map do |id|
      gato = gatos_by_id[id]
      next unless gato
      
      # Crear un objeto con nombre del gato y conteo de visitas
      OpenStruct.new(
        id: gato.id,
        name: gato.name,
        visit_count: gato_views[id]
      )
    end.compact
  end
end