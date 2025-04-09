module GatosHelper
  # Asigna una clase de color Bootstrap según la categoría del tag
  def tag_color_class(tag_name)
    case tag_name
    # Nivel de actividad
    when "MuyActivo", "Activo", "Juguetón"
      "bg-danger text-white"
    when "Moderado"
      "bg-warning text-dark"
    when "Tranquilo"
      "bg-info text-dark"

    # Temperamento
    when "Sociable", "Cariñoso", "Leal"
      "bg-success text-white"
    when "Independiente", "Tímido"
      "bg-secondary text-white"
    when "Vocal"
      "bg-primary text-white"
    when "Silencioso"
      "bg-light text-dark"
    when "Inteligente"
      "bg-info text-white"

    # Mantenimiento
    when "BajoMantenimiento", "PocaMuda"
      "bg-success text-white"
    when "AltoMantenimiento", "CepilladoDiario", "CepilladoSemanal"
      "bg-warning text-dark"

    # Convivencia
    when "BuenoConNiños", "BuenoConPerros", "BuenoConGatos"
      "bg-success text-white"
    when "MejorSolo"
      "bg-danger text-white"

    # Entorno
    when "AptoPisos"
      "bg-primary text-white"
    when "NecesitaEspacio"
      "bg-warning text-dark"
    when "GatoDeInterior"
      "bg-light text-dark border border-dark"
    when "PuedeEstarExterior"
      "bg-dark text-white"

    # Características especiales
    when "Hipoalergénico"
      "bg-success text-white"
    when "LeGustaElAgua", "GranTrepador"
      "bg-info text-white"
    when "RazaAntigua"
      "bg-secondary text-white"
    when "RazaNueva"
      "bg-primary text-white"

    # Salud
    when "VidaLarga"
      "bg-success text-white"
    when "RequiereControlEspecial"
      "bg-danger text-white"
    when "PropensoObesidad"
      "bg-warning text-dark"

    # Default
    else
      "bg-secondary text-white"
    end
  end
end
