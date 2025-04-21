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

### Requisitos del Sistema
- Ruby 3.x
- Node.js
- PostgreSQL
- Yarn

## 4. Estructura de la Base de Datos

### Modelo: Gato
- **name**: string (nombre de la raza)
- **breed**: string (clasificación/tipo de raza)
- **description**: text (descripción detallada)
- **image**: Active Storage attachment
- **user_id**: references (relación con el usuario que lo creó)

### Modelo: User (proporcionado por Devise)
- **email**: string
- **encrypted_password**: string
- **reset_password_token**: string
- **reset_password_sent_at**: datetime
- **remember_created_at**: datetime
- **Relaciones**: has_many :gatos

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
4. Sube imagen de la raza
5. Envía el formulario
6. Recibe confirmación de creación exitosa

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

## 9. Accesibilidad y Responsividad

- Diseño completamente responsivo para móviles, tablets y escritorio
- Contraste adecuado de colores para legibilidad
- Textos alternativos para imágenes
- Marcado semántico para lectores de pantalla
- Navegación accesible por teclado

## 10. Plan de Implementación

### Fase 1: Configuración Inicial
- Configurar Rails con PostgreSQL
- Implementar autenticación con Devise
- Crear modelos básicos y migraciones

### Fase 2: Funcionalidad Principal
- Implementar CRUD para Gatos
- Configurar Active Storage para imágenes
- Desarrollar la funcionalidad de usuario

### Fase 3: Diseño de Interfaz
- Implementar diseño responsivo con Bootstrap
- Crear componentes de interfaz
- Desarrollar modo oscuro

### Fase 4: Refinamiento
- Optimizar rendimiento
- Mejorar UX/UI basado en feedback
- Pruebas y correcciones

## 11. Consideraciones Futuras

- Implementación de sistema de búsqueda y filtrado
- Categorización avanzada de razas de gatos
- Sistema de votación o "me gusta" para entradas populares
- Sección de comentarios para discusión
- Internacionalización para múltiples idiomas
