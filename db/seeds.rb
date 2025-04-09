# Datos para las 20 razas de gatos más populares para seeds.rb con sistema de tags

# Asegúrate de tener usuarios creados previamente o crear algunos antes de ejecutar este seed
# Por ejemplo, puedes añadir esto antes si necesitas usuarios:
# 
# User.create!(
#   email: 'usuario1@ejemplo.com',
#   password: 'password123',
#   password_confirmation: 'password123'
# )
# 
# User.create!(
#   email: 'usuario2@ejemplo.com',
#   password: 'password123',
#   password_confirmation: 'password123'
# )

# Asumimos que ya hay al menos un usuario en la base de datos
user_ids = User.pluck(:id)

# Primero creamos todos los tags únicos que usaremos
puts "Creando tags..."

# Nivel de actividad
tag_actividad = {
  muy_activo: Tag.find_or_create_by(name: "MuyActivo"),
  activo: Tag.find_or_create_by(name: "Activo"),
  moderado: Tag.find_or_create_by(name: "Moderado"),
  tranquilo: Tag.find_or_create_by(name: "Tranquilo"),
  jugueton: Tag.find_or_create_by(name: "Juguetón")
}

# Temperamento
tag_temperamento = {
  sociable: Tag.find_or_create_by(name: "Sociable"),
  independiente: Tag.find_or_create_by(name: "Independiente"),
  carinoso: Tag.find_or_create_by(name: "Cariñoso"),
  timido: Tag.find_or_create_by(name: "Tímido"),
  vocal: Tag.find_or_create_by(name: "Vocal"),
  silencioso: Tag.find_or_create_by(name: "Silencioso"),
  inteligente: Tag.find_or_create_by(name: "Inteligente"),
  leal: Tag.find_or_create_by(name: "Leal")
}

# Mantenimiento
tag_mantenimiento = {
  bajo_mantenimiento: Tag.find_or_create_by(name: "BajoMantenimiento"),
  alto_mantenimiento: Tag.find_or_create_by(name: "AltoMantenimiento"),
  cepillado_diario: Tag.find_or_create_by(name: "CepilladoDiario"),
  cepillado_semanal: Tag.find_or_create_by(name: "CepilladoSemanal"),
  poca_muda: Tag.find_or_create_by(name: "PocaMuda")
}

# Convivencia
tag_convivencia = {
  bueno_ninos: Tag.find_or_create_by(name: "BuenoConNiños"),
  bueno_perros: Tag.find_or_create_by(name: "BuenoConPerros"),
  bueno_gatos: Tag.find_or_create_by(name: "BuenoConGatos"),
  mejor_solo: Tag.find_or_create_by(name: "MejorSolo")
}

# Entorno
tag_entorno = {
  apto_pisos: Tag.find_or_create_by(name: "AptoPisos"),
  necesita_espacio: Tag.find_or_create_by(name: "NecesitaEspacio"),
  interior: Tag.find_or_create_by(name: "GatoDeInterior"),
  exterior: Tag.find_or_create_by(name: "PuedeEstarExterior")
}

# Características especiales
tag_especial = {
  hipoalergenico: Tag.find_or_create_by(name: "Hipoalergénico"),
  agua: Tag.find_or_create_by(name: "LeGustaElAgua"),
  trepador: Tag.find_or_create_by(name: "GranTrepador"),
  raza_antigua: Tag.find_or_create_by(name: "RazaAntigua"),
  raza_nueva: Tag.find_or_create_by(name: "RazaNueva")
}

# Salud
tag_salud = {
  vida_larga: Tag.find_or_create_by(name: "VidaLarga"),
  control_especial: Tag.find_or_create_by(name: "RequiereControlEspecial"),
  propenso_obesidad: Tag.find_or_create_by(name: "PropensoObesidad")
}

puts "Tags creados exitosamente!"

# Datos de los gatos con sus tags correspondientes
gatos_data = [
  {
    name: "Luna",
    breed: "Maine Coon",
    description: "Luna es una gata Maine Coon con personalidad gentil y juguetona. Los Maine Coon son conocidos como 'gigantes amables' y disfrutan de la compañía humana. Requieren cepillado regular por su pelaje largo y denso, especialmente en las zonas propensas a enredos como el cuello y la cola. Son gatos activos que necesitan juguetes interactivos y espacios para trepar. Su gran tamaño requiere alimentación equilibrada controlada para prevenir obesidad. Son sorprendentemente adaptables y tolerantes con niños y otros animales.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:sociable],
      tag_temperamento[:carinoso],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_ninos],
      tag_convivencia[:bueno_perros],
      tag_convivencia[:bueno_gatos],
      tag_especial[:agua],
      tag_especial[:trepador],
      tag_salud[:propenso_obesidad],
      tag_entorno[:necesita_espacio]
    ]
  },
  {
    name: "Oliver",
    breed: "Persa",
    description: "Oliver tiene la personalidad tranquila y digna característica de los Persas. Es cariñoso pero reservado, prefiriendo observar antes de interactuar. Los Persas necesitan cepillado diario para evitar nudos en su pelaje largo y denso, limpieza facial regular para prevenir manchas por lagrimeo, y ambientes frescos o climatizados en verano. Son poco activos y disfrutan de siestas largas en lugares cómodos. Prefieren rutinas estables y ambientes tranquilos. Pueden desarrollar problemas respiratorios por su cara plana.",
    tags: [
      tag_actividad[:tranquilo],
      tag_temperamento[:carinoso],
      tag_temperamento[:independiente],
      tag_mantenimiento[:alto_mantenimiento],
      tag_mantenimiento[:cepillado_diario],
      tag_entorno[:interior],
      tag_entorno[:apto_pisos],
      tag_especial[:raza_antigua],
      tag_salud[:control_especial]
    ]
  },
  {
    name: "Mia",
    breed: "Siamés",
    description: "Mia es extremadamente vocal e inteligente, características típicas de los Siameses. Forma vínculos intensos con su persona favorita y demanda atención constante. Los Siameses necesitan estimulación mental diaria, juegos interactivos y compañía regular para evitar ansiedad por separación. Son activos y atléticos, disfrutan de juguetes tipo puzzle y aprenden trucos fácilmente. Su metabolismo acelerado puede requerir alimentación más frecuente con porciones controladas. Son sensibles a temperaturas extremas por su pelaje fino.",
    tags: [
      tag_actividad[:activo],
      tag_temperamento[:vocal],
      tag_temperamento[:inteligente],
      tag_temperamento[:carinoso],
      tag_mantenimiento[:bajo_mantenimiento],
      tag_mantenimiento[:poca_muda],
      tag_entorno[:interior],
      tag_entorno[:apto_pisos],
      tag_especial[:raza_antigua]
    ]
  },
  {
    name: "Leo",
    breed: "Ragdoll",
    description: "Leo tiene la personalidad dócil y relajada propia de los Ragdoll, llegando incluso a aflojarse en brazos cuando se le levanta. Es extremadamente paciente y tolerante con manipulación. Los Ragdoll necesitan cepillado semanal para su pelaje semilargo, dieta controlada para prevenir obesidad dado su tamaño grande y naturaleza sedentaria, y juguetes interactivos sencillos. No tienen gran instinto de trepar pero disfrutan de plataformas bajas. Son extremadamente sociables y no toleran bien largos periodos de soledad.",
    tags: [
      tag_actividad[:tranquilo],
      tag_temperamento[:sociable],
      tag_temperamento[:carinoso],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_ninos],
      tag_convivencia[:bueno_perros],
      tag_convivencia[:bueno_gatos],
      tag_entorno[:interior],
      tag_entorno[:apto_pisos],
      tag_salud[:propenso_obesidad],
      tag_especial[:raza_nueva]
    ]
  },
  {
    name: "Simba",
    breed: "Bengalí",
    description: "Simba posee la energía y curiosidad incansable característica de los Bengalíes. Es extremadamente atlético, inteligente y necesita estimulación constante. Los Bengalíes requieren ejercicio diario intenso, juguetes que simulen caza, espacios verticales para trepar y superficies para correr. Pueden entrenarse para pasear con arnés. Su pelaje distintivo necesita cepillado semanal y dieta alta en proteínas para mantener su musculatura. Son fascindados por el agua y pueden aprender a abrir grifos o jugar con ella.",
    tags: [
      tag_actividad[:muy_activo],
      tag_temperamento[:inteligente],
      tag_mantenimiento[:bajo_mantenimiento],
      tag_mantenimiento[:cepillado_semanal],
      tag_entorno[:necesita_espacio],
      tag_especial[:agua],
      tag_especial[:trepador],
      tag_especial[:raza_nueva]
    ]
  },
  {
    name: "Bella",
    breed: "British Shorthair",
    description: "Bella tiene la personalidad reservada e independiente típica de los British Shorthair. Es afectuosa pero no necesitada, prefiriendo estar cerca sin ser cargada. Los British Shorthair tienen tendencia a la obesidad, requiriendo control de porciones y ejercicio regular mediante juegos interactivos programados. Su pelaje denso necesita cepillado semanal, más frecuente durante cambios de estación. Son pacientes con niños pero necesitan que se respete su espacio personal. Disfrutan de rutinas predecibles y pueden estresarse con cambios importantes.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:independiente],
      tag_temperamento[:silencioso],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_ninos],
      tag_entorno[:apto_pisos],
      tag_salud[:propenso_obesidad],
      tag_salud[:vida_larga]
    ]
  },
  {
    name: "Max",
    breed: "Sphynx",
    description: "Max posee la personalidad extrovertida y demandante de atención característica de los Sphynx. Es extremadamente cariñoso, enérgico y sociable con cualquier visitante. Los Sphynx, al no tener pelo, requieren baños semanales para eliminar aceites corporales, protección solar o ropa en días soleados, y ambientes cálidos en invierno. Su alto metabolismo necesita alimentación de alta calidad y porciones más frecuentes. Buscan activamente fuentes de calor y disfrutan dormir bajo mantas o junto a otros animales o personas.",
    tags: [
      tag_actividad[:activo],
      tag_temperamento[:sociable],
      tag_temperamento[:carinoso],
      tag_mantenimiento[:alto_mantenimiento],
      tag_convivencia[:bueno_ninos],
      tag_convivencia[:bueno_gatos],
      tag_entorno[:interior],
      tag_especial[:hipoalergenico],
      tag_salud[:control_especial]
    ]
  },
  {
    name: "Cleo",
    breed: "Exótico de pelo corto",
    description: "Cleo tiene la personalidad tranquila del Persa pero con mayor juguetosidad. Es afectuosa, paciente y adaptable a diferentes ambientes. Los Exóticos requieren cepillado semanal para controlar la muda, limpieza facial regular para prevenir manchas por lagrimeo, y ambientes frescos en verano. Son moderadamente activos, disfrutando de juego en sesiones cortas seguidas de siestas prolongadas. Su cara plana puede causar problemas respiratorios, requiriendo vigilancia en días calurosos y durante ejercicio.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:carinoso],
      tag_temperamento[:silencioso],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_ninos],
      tag_entorno[:apto_pisos],
      tag_entorno[:interior],
      tag_salud[:control_especial],
      tag_especial[:raza_nueva]
    ]
  },
  {
    name: "Shadow",
    breed: "Abisinio",
    description: "Shadow tiene la curiosidad insaciable y energía constante típica de los Abisinios. Es inteligente, atlético y siempre alerta. Los Abisinios necesitan estimulación mental diaria, juguetes interactivos variados, espacios verticales extensos y sesiones de juego programadas. Su pelaje corto pero denso requiere cepillado semanal para eliminar pelos muertos. Son muy sociables pero independientes, prefiriendo estar cerca de sus humanos sin ser extremadamente demandantes. Disfrutan observando desde puntos altos y participando en todas las actividades familiares.",
    tags: [
      tag_actividad[:muy_activo],
      tag_temperamento[:inteligente],
      tag_temperamento[:independiente],
      tag_mantenimiento[:bajo_mantenimiento],
      tag_especial[:trepador],
      tag_especial[:raza_antigua],
      tag_entorno[:necesita_espacio]
    ]
  },
  {
    name: "Nala",
    breed: "Scottish Fold",
    description: "Nala tiene la personalidad dulce y adaptable característica de los Scottish Fold. Es juguetona pero no hiperactiva, disfrutando tanto de sesiones de juego como de momentos tranquilos. Los Scottish Fold, debido a la mutación genética de sus orejas, necesitan vigilancia de articulaciones y cartílagos, evitar saltos excesivos, y estimulación mental para compensar posible reducción de actividad física. Son extremadamente sociables, formando vínculos fuertes con todos los miembros de la familia. Disfrutan de juguetes interactivos sencillos y compañía constante.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:sociable],
      tag_temperamento[:carinoso],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_ninos],
      tag_convivencia[:bueno_gatos],
      tag_entorno[:apto_pisos],
      tag_salud[:control_especial]
    ]
  },
  {
    name: "Rocky",
    breed: "Americano de pelo corto",
    description: "Rocky tiene la personalidad equilibrada y adaptable del Americano de pelo corto. Es amigable, independiente y moderadamente activo. Esta raza es conocida por su salud robusta y requiere cuidados básicos: cepillado semanal para controlar la muda, juguetes variados para estimulación, y control de peso mediante alimentación medida. Son excelentes cazadores y disfrutan de juguetes que simulen presas. Se adaptan bien a diferentes estilos de vida, desde hogares tranquilos hasta familias activas con niños.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:independiente],
      tag_mantenimiento[:bajo_mantenimiento],
      tag_convivencia[:bueno_ninos],
      tag_convivencia[:bueno_perros],
      tag_convivencia[:bueno_gatos],
      tag_entorno[:exterior],
      tag_salud[:vida_larga]
    ]
  },
  {
    name: "Milo",
    breed: "Burmés",
    description: "Milo posee la personalidad extremadamente social y dependiente característica de los Burmeses. Es cariñoso, vocal y siempre busca compañía humana. Los Burmeses forman vínculos intensos con sus familias, sufriendo ansiedad por separación si se les deja solos por periodos prolongados. Su pelaje corto y brillante requiere cepillado ocasional. Son inteligentes y disfrutan de juegos interactivos y de aprendizaje. Tienden a seguir a sus humanos por toda la casa y prefieren dormir en contacto directo con ellos.",
    tags: [
      tag_actividad[:activo],
      tag_temperamento[:carinoso],
      tag_temperamento[:vocal],
      tag_temperamento[:inteligente],
      tag_mantenimiento[:bajo_mantenimiento],
      tag_mantenimiento[:poca_muda],
      tag_convivencia[:bueno_ninos],
      tag_entorno[:apto_pisos]
    ]
  },
  {
    name: "Lily",
    breed: "Devon Rex",
    description: "Lily tiene la personalidad traviesa e hiperactiva característica del Devon Rex. Es extremadamente curiosa, juguetona y mantiene comportamiento juvenil incluso en edad adulta. Los Devon Rex tienen metabolismo acelerado, requiriendo alimentación de calidad en porciones controladas. Su pelaje fino y rizado necesita limpieza ocasional con paño húmedo en lugar de cepillado intenso. Son sensibles al frío por su pelaje escaso. Extremadamente ágiles y acrobáticos, necesitan espacio vertical para trepar y explorar. Forman vínculos intensos y pueden aprender trucos complejos.",
    tags: [
      tag_actividad[:muy_activo],
      tag_temperamento[:inteligente],
      tag_temperamento[:carinoso],
      tag_mantenimiento[:bajo_mantenimiento],
      tag_mantenimiento[:poca_muda],
      tag_especial[:hipoalergenico],
      tag_especial[:trepador],
      tag_entorno[:apto_pisos]
    ]
  },
  {
    name: "Charlie",
    breed: "Bosque de Noruega",
    description: "Charlie posee la personalidad independiente pero amigable típica del Bosque de Noruega. Es paciente, equilibrado y disfruta de actividad moderada alternada con descanso. Esta raza robusta y nativa de climas fríos tiene pelaje doble impermeable que requiere cepillado semanal, más frecuente durante cambios de estación. Son trepadores excepcionales que necesitan rascadores altos y superficies verticales. Disfrutan de juegos que simulen caza. Son pacientes con niños y otros animales, adaptándose bien a la vida familiar activa.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:independiente],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_ninos],
      tag_especial[:trepador],
      tag_especial[:raza_antigua],
      tag_entorno[:exterior],
      tag_entorno[:necesita_espacio]
    ]
  },
  {
    name: "Princess",
    breed: "Himalayo",
    description: "Princess tiene la personalidad tranquila y digna característica de los Himalayos. Es afectuosa con su familia pero reservada con extraños. Los Himalayos combinan características de Persas y Siameses, necesitando cepillado diario para su largo pelaje, limpieza facial regular, y ambientes frescos. Son moderadamente activos, disfrutando de juguetes interactivos en sesiones cortas. Pueden ser más vocales que los Persas pero menos que los Siameses. Prefieren rutinas estables y ambientes tranquilos. Su cara plana requiere vigilancia para problemas respiratorios y oculares.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:carinoso],
      tag_temperamento[:vocal],
      tag_mantenimiento[:alto_mantenimiento],
      tag_mantenimiento[:cepillado_diario],
      tag_entorno[:interior],
      tag_salud[:control_especial],
      tag_especial[:raza_nueva]
    ]
  },
  {
    name: "Felix",
    breed: "Russian Blue",
    description: "Felix tiene la personalidad reservada pero leal característica de los Russian Blue. Es observador, cauteloso con extraños pero extremadamente afectuoso con su familia elegida. Los Russian Blue son sensibles a cambios en su entorno, prefiriendo rutinas estables. Su pelaje corto pero denso requiere cepillado semanal para eliminar pelos muertos. Son inteligentes y disfrutan de juguetes puzzle y juegos interactivos. Mantienen un comportamiento digno y elegante, rara vez escandalosos. Son meticulosos con su higiene y prefieren bandejas sanitarias impecablemente limpias.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:timido],
      tag_temperamento[:inteligente],
      tag_temperamento[:silencioso],
      tag_mantenimiento[:bajo_mantenimiento],
      tag_mantenimiento[:poca_muda],
      tag_especial[:hipoalergenico],
      tag_entorno[:apto_pisos],
      tag_salud[:vida_larga]
    ]
  },
  {
    name: "Oreo",
    breed: "Bombay",
    description: "Oreo posee la personalidad social y juguetona característica de los Bombay. Es inteligente, curiosa y disfruta siendo el centro de atención. Los Bombay son conocidos como 'mini panteras' por su pelaje negro brillante, que requiere poco mantenimiento más allá de caricias regulares con un paño de gamuza para mantener su brillo. Son activos y disfrutan de juegos interactivos. Forman vínculos fuertes con sus humanos y pueden ser bastante demandantes de atención. Tienen voces distintivas y no dudan en utilizarlas para comunicar sus necesidades.",
    tags: [
      tag_actividad[:activo],
      tag_temperamento[:sociable],
      tag_temperamento[:inteligente],
      tag_temperamento[:vocal],
      tag_mantenimiento[:bajo_mantenimiento],
      tag_mantenimiento[:poca_muda],
      tag_convivencia[:bueno_ninos],
      tag_entorno[:apto_pisos],
      tag_especial[:raza_nueva]
    ]
  },
  {
    name: "Whiskers",
    breed: "Manx",
    description: "Whiskers tiene la personalidad independiente pero cariñosa característica de los Manx. Es juguetón, territorial y sorprendentemente ágil a pesar de su falta de cola. Los Manx requieren vigilancia de problemas de columna vertebral relacionados con su mutación genética. Su pelaje doble denso necesita cepillado semanal, más frecuente durante cambios de estación. Son excelentes cazadores y disfrutan de juguetes interactivos. Tienen personalidades similares a perros, pudiendo aprender a traer objetos y siguiendo a sus humanos por la casa.",
    tags: [
      tag_actividad[:activo],
      tag_temperamento[:inteligente],
      tag_temperamento[:leal],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_perros],
      tag_entorno[:exterior],
      tag_salud[:control_especial],
      tag_especial[:raza_antigua]
    ]
  },
  {
    name: "Tigger",
    breed: "Naranja Tabby",
    description: "Tigger tiene la personalidad extrovertida y amigable común en gatos naranjas tabby. Es juguetón, curioso y generalmente vocal. Aunque 'Tabby naranja' es un patrón de color y no una raza específica, estos gatos tienen reputación de ser especialmente sociables. Requieren estimulación regular, juguetes variados y rascadores. Su pelaje de longitud media necesita cepillado semanal para controlar la muda. Tienden a formar vínculos fuertes con todos los miembros de la familia y suelen ser tolerantes con niños y otros animales. Pueden tener tendencia al sobrepeso.",
    tags: [
      tag_actividad[:activo],
      tag_temperamento[:sociable],
      tag_temperamento[:vocal],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_ninos],
      tag_convivencia[:bueno_perros],
      tag_convivencia[:bueno_gatos],
      tag_salud[:propenso_obesidad]
    ]
  },
  {
    name: "Snowball",
    breed: "Sagrado de Birmania",
    description: "Snowball posee la personalidad equilibrada y gentil característica de los Birmanos. Es afectuoso sin ser demandante, inteligente y adaptable a diversos ambientes. Los Sagrados de Birmania tienen pelaje semilargo que rara vez se enreda, requiriendo cepillado semanal. Son moderadamente activos, disfrutando tanto de juegos interactivos como de observación tranquila. Forman vínculos fuertes pero mantienen cierta independencia. Son conocidos por su temperamento excepcionalmente equilibrado, tolerando bien manipulación, niños y otros animales. Prefieren compañía pero manejan bien periodos solos.",
    tags: [
      tag_actividad[:moderado],
      tag_temperamento[:carinoso],
      tag_temperamento[:inteligente],
      tag_mantenimiento[:cepillado_semanal],
      tag_convivencia[:bueno_ninos],
      tag_convivencia[:bueno_gatos],
      tag_entorno[:apto_pisos],
      tag_especial[:raza_antigua]
    ]
  }
]

# Crear los registros de gatos con sus tags asociados
gatos_data.each do |gato_data|
  # Seleccionar un usuario aleatorio
  user_id = user_ids.sample
  
  # Crear el gato asociado al usuario
  gato = Gato.create!(
    name: gato_data[:name],
    breed: gato_data[:breed],
    description: gato_data[:description],
    user_id: user_id
  )
  
  # Asociar los tags al gato
  gato_data[:tags].each do |tag|
    gato.tags << tag
  end
  
  # Nota: Para añadir imágenes, necesitarías usar Active Storage.
  # Esto es solo un ejemplo y requeriría tener archivos de imagen disponibles:
  #
  # if Rails.env.development?
  #   gato.image.attach(
  #     io: File.open(Rails.root.join('db', 'seed_images', "#{gato_data[:name].downcase}.jpg")),
  #     filename: "#{gato_data[:name].downcase}.jpg",
  #     content_type: 'image/jpeg'
  #   )
  # end
  
  puts "Gato creado: #{gato.name} - #{gato.breed} con #{gato.tags.count} tags"
end

puts "¡20 gatos de razas populares creados exitosamente con sus tags correspondientes!"