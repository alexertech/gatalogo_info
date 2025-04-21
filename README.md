# Documento de Diseño - Proyecto Gatalogo

## 1. Visión General del Proyecto

Gatalogo es una aplicación web tipo "Wikipedia para gatos" desarrollada con Ruby on Rails 7.2 y PostgreSQL. La plataforma permite a los usuarios registrados crear, editar y explorar un catálogo detallado de razas de gatos, incluyendo imágenes, descripciones y características específicas.

## 2. Objetivos del Proyecto

- Crear una plataforma colaborativa para documentar todas las razas de gatos del mundo
- Permitir a los usuarios contribuir con nuevo contenido y mejorar el existente
- Proporcionar información precisa y educativa sobre diferentes razas de gatos
- Ofrecer una experiencia de usuario intuitiva con un diseño moderno y responsivo

## 3. Especificaciones Técnicas

### Tecnologías Principales
- **Backend**: Ruby on Rails 7.2
- **Base de Datos**: PostgreSQL
- **Frontend**: Bootstrap, Sass, JavaScript
- **Autenticación**: Devise
- **Almacenamiento de Imágenes**: Active Storage
- **Empaquetado de Assets**: CSS Bundling Rails
- **JavaScript Framework**: Stimulus
- **Analíticas**: Sistema integrado de seguimiento de eventos (AnalyticsTracker middleware)
- **Visualización de Datos**: Chart.js
- **Testing**: RSpec, Factory Bot, Shoulda Matchers, Capybara
- **Sistema de Roles**: Administradores y usuarios regulares
- **Internacionalización**: I18n (soporte para español e inglés)

### Requisitos del Sistema
- Ruby 3.x
- Node.js
- PostgreSQL
- Yarn
- Bundler

## 4. Estructura de la Base de Datos

### Modelo: Gato
- **name**: string (nombre de la raza)
- **breed**: string (clasificación/tipo de raza)
- **description**: text (descripción detallada)
- **image**: Active Storage attachment
- **user_id**: references (relación con el usuario que lo creó)
- **Relaciones**: 
  - belongs_to :user
  - has_and_belongs_to_many :tags

### Modelo: Tag
- **name**: string (nombre de la etiqueta)
- **Relaciones**: has_and_belongs_to_many :gatos

### Modelo: User (proporcionado por Devise)
- **email**: string
- **encrypted_password**: string
- **reset_password_token**: string
- **reset_password_sent_at**: datetime
- **remember_created_at**: datetime
- **role**: string (default: "user")
- **Relaciones**: has_many :gatos, dependent: :destroy

### Modelo: Event (para analíticas)
- **event_type**: string (tipo de evento: page_view, gato_view, etc.)
- **user_id**: references (opcional, relación con el usuario)
- **trackable_id**: integer (ID del objeto relacionado)
- **trackable_type**: string (tipo del objeto relacionado)
- **metadata**: jsonb (datos adicionales del evento)
- **ip_address**: string (dirección IP del visitante)
- **user_agent**: string (navegador/dispositivo del visitante)
- **created_at**: datetime (momento del evento)
- **updated_at**: datetime
- **Tipos de eventos**: page_view, gato_view, search, registration, login, gato_create, gato_update, gato_delete

## 5. Funcionalidades Principales

### Para Usuarios No Registrados
- Ver la página de inicio con información sobre el proyecto
- Navegar por el catálogo de razas de gatos
- Ver detalles específicos de cada gato
- Registrarse en la plataforma

### Para Usuarios Registrados
- Todas las funcionalidades de usuarios no registrados
- Crear nuevas entradas de razas de gatos
- Editar sus propias entradas
- Subir imágenes de gatos
- Eliminar sus propias entradas
- Gestionar su perfil de usuario

### Para Administradores
- Todas las funcionalidades de usuarios registrados
- Acceso al panel de administración
- Visualización de analíticas y métricas
- Gestión de usuarios y contenido
- Monitoreo de actividad del sitio
- Gestión de etiquetas
- Dashboard administrativo
- Configuración de opciones de monetización

## 6. Diseño de Interfaz

### Esquema de Color
- **Modo Claro**:
  - Fondo principal: #f9f9f9
  - Tarjetas y contenedores: #fff
  - Acentos: Colores de Bootstrap (primario, secundario)
  - Texto: #333
  - Sombras: rgba(0, 0, 0, 0.1)

- **Modo Oscuro**:
  - Fondo principal: #121212
  - Tarjetas y contenedores: #2b3035
  - Acentos: Versiones ajustadas de los colores de Bootstrap
  - Texto: #e1e1e1
  - Sombras: rgba(0, 0, 0, 0.25)

### Componentes Principales
- **Barra de Navegación**: Contiene logo, enlaces de navegación, opciones de usuario y toggle de modo oscuro
- **Tarjetas de Gato**: Muestran imagen de portada, nombre, raza y extracto de la descripción
- **Página de Detalle**: Imagen a la izquierda, descripción a la derecha
- **Formularios**: Estilo limpio y moderno con validaciones visuales
- **Página de Inicio**: Héroe con llamada a la acción, sección informativa y muestra de gatos destacados

### Dimensiones de Imágenes
- **Imagen Héroe**: 600x400px
- **Tarjetas de Gatos**: 400x300px
- **Imagen de Comunidad**: 500x350px
- **Imagen de Detalle de Gato**: 800x1000px (orientación vertical)

## 7. Flujos de Usuario

### Registro y Autenticación
1. Usuario navega a la página de registro
2. Completa formulario con email y contraseña
3. Recibe confirmación de registro exitoso
4. Inicia sesión con credenciales

### Creación de Nuevo Gato
1. Usuario inicia sesión
2. Navega a "Añadir Nuevo Gato"
3. Completa formulario con nombre, raza, descripción
4. Selecciona etiquetas relevantes o crea nuevas
5. Sube imagen de la raza
6. Envía el formulario
7. Recibe confirmación de creación exitosa
8. El sistema registra el evento "gato_create" en las analíticas

### Exploración del Catálogo
1. Usuario navega a "Gatos" en el menú
2. Visualiza lista de tarjetas con todos los gatos
3. Hace clic en un gato para ver detalles
4. En la página de detalle, puede volver al catálogo

## 8. Modo Oscuro

La aplicación incluye funcionalidad de modo oscuro que:
- Respeta las preferencias del sistema del usuario
- Permite cambiar manualmente entre modos claro y oscuro
- Guarda la preferencia del usuario en localStorage
- Aplica estilos adecuados a todos los componentes

## 9. Sistema de Analíticas Integrado

### Panel de Administración
- Dashboard principal con métricas clave
- Gráficos y estadísticas generados con Chart.js
- Acceso restringido a usuarios con rol de administrador

### Métricas Rastreadas
- Vistas de página (totales, por ruta, tendencias)
- Perfiles de gatos más populares
- Actividad de usuarios registrados
- Tasas de conversión (visitantes a registros)
- Términos de búsqueda populares

### Implementación Técnica
- Middleware personalizado (AnalyticsTracker) para seguimiento de vistas de página
- Modelo Event para almacenar todos los eventos del sistema 
- Trackable polymorphic para asociar eventos con diferentes modelos
- Dashboard administrativo para visualización de métricas
- Sin dependencias de servicios de analíticas de terceros
- Datos almacenados en la base de datos propia de la aplicación
- Índices optimizados para consultas rápidas de analíticas

## 10. Accesibilidad y Responsividad

- Diseño completamente responsivo para móviles, tablets y escritorio
- Contraste adecuado de colores para legibilidad
- Textos alternativos para imágenes
- Marcado semántico para lectores de pantalla
- Navegación accesible por teclado

## 11. Plan de Implementación

### Fase 1: Configuración Inicial (Completada)
- Configurar Rails con PostgreSQL
- Implementar autenticación con Devise
- Crear modelos básicos y migraciones

### Fase 2: Funcionalidad Principal (Completada)
- Implementar CRUD para Gatos
- Configurar Active Storage para imágenes
- Desarrollar la funcionalidad de usuario
- Implementar sistema de etiquetas
- Crear sistema de roles (Admin/Usuario)

### Fase 3: Diseño de Interfaz (Completada)
- Implementar diseño responsivo con Bootstrap
- Crear componentes de interfaz
- Desarrollar modo oscuro
- Implementar internacionalización (ES/EN)

### Fase 4: Analytics y Panel Administrativo (Completada)
- Implementar middleware para seguimiento de eventos
- Crear modelo Event para almacenar analíticas
- Desarrollar dashboard administrativo
- Implementar visualización de datos con Chart.js

### Fase 5: Refinamiento (En Progreso)
- Optimizar rendimiento
- Mejorar UX/UI basado en feedback
- Pruebas y correcciones
- Implementar funcionalidades avanzadas de búsqueda

## 12. Estrategias de Monetización

### Estrategias a Corto Plazo
- **Afiliación**: Enlaces de afiliados a productos recomendados para cada raza
  - Programas como Amazon, Chewy, tiendas especializadas de mascotas
  - Recomendaciones personalizadas según la raza de gato
  - Implementación técnica sencilla con retorno rápido

### Estrategias a Medio Plazo
- **Contenido Patrocinado**: Artículos y perfiles de razas patrocinados
  - Guías de cuidado específicas para razas patrocinadas por marcas
  - Secciones "Recomendado por expertos" con contenido de marcas
  - Transparencia en etiquetado de contenido patrocinado

- **Publicidad Contextual**: Anuncios relevantes sobre productos para gatos
  - Espacios designados para banners no intrusivos
  - Anuncios de tiendas de mascotas y servicios veterinarios locales
  - Sistema de gestión de anuncios propio (sin depender de servicios externos)

### Estrategias a Largo Plazo
- **Marketplace Integrado**: Plataforma para conectar criadores éticos con adoptantes
  - Sistema de perfiles verificados para criadores
  - Comisiones por transacciones completadas
  - Integración con pasarelas de pago (Stripe, PayPal)

- **Modelo Freemium**: Funciones avanzadas para usuarios premium
  - Contenido exclusivo sobre cuidados especializados
  - Herramientas de compatibilidad entre razas
  - Sin publicidad para miembros premium

### Implementación y Medición
- Seguimiento de métricas de conversión en el panel de administración
- A/B testing para optimizar posicionamiento y presentación
- Análisis de canales de monetización más efectivos
- Equilibrio entre ingresos y experiencia de usuario

## 13. Consideraciones Futuras

- Implementación de sistema de búsqueda avanzada y filtrado por etiquetas
- Categorización avanzada de razas de gatos
- Sistema de votación o "me gusta" para entradas populares
- Sección de comentarios para discusión
- Expansión de internacionalización para más idiomas
- API para integración con aplicaciones de terceros
- Comunidad de expertos verificados en razas específicas
- Implementación del sistema de monetización
- Aplicación móvil nativa
- Exportación de informes de análisis para administradores
- Integración con redes sociales