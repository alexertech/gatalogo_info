class AnalyticsTracker
  def initialize(app)
    @app = app
  end

  def call(env)
    Rails.logger.info "AnalyticsTracker: Processing request..."
    request = ActionDispatch::Request.new(env)
    status, headers, response = @app.call(env)

    # Solo rastrear rutas de la aplicación, no assets
    
    if request.path.match(/^\/\(gatos|gato|home\)/) && !request.xhr?
      Rails.logger.info "AnalyticsTracker: Match..."
      track_page_view(request)
    end

    [ status, headers, response ]
  end

  private

  def track_page_view(request)
    return if bot_request?(request)

    # Determinar el tipo de evento basado en la ruta (simplificado)
    event_type = "page_view"

    # Ejecución asíncrona para no ralentizar la respuesta
    Thread.new do
      begin
        user_id = request.session[:user_id]

         Rails.logger.info "EventCreate: Match..."

        Event.create(
          event_type: event_type,
          user_id: user_id,
          ip_address: request.remote_ip,
          user_agent: request.user_agent,
          metadata: {
            path: request.path,
            query: request.query_parameters,
            referrer: request.referrer
          }
        )
      ensure
        # Evitar fugas de memoria liberando la conexión
        ActiveRecord::Base.connection_pool.release_connection
      end
    end
  end

  def bot_request?(request)
    user_agent = request.user_agent.to_s.downcase

    # Lista básica de patrones de user-agent de bots comunes
    bot_patterns = [
      "bot", "crawl", "spider", "slurp", "baiduspider",
      "yandex", "googlebot", "bingbot", "semrushbot"
    ]

    # Verificar si el user-agent contiene algún patrón de bot
    bot_patterns.any? { |pattern| user_agent.include?(pattern) }
  end
end
