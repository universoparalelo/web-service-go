[![Build and Test](https://github.com/universoparalelo/web-service-go/actions/workflows/go.yml/badge.svg)](https://github.com/universoparalelo/web-service-go/actions/workflows/go.yml)

[![Release](https://github.com/universoparalelo/web-service-go/actions/workflows/release.yml/badge.svg)](https://github.com/universoparalelo/web-service-go/actions/workflows/release.yml)

# Web Service API - Materias y Profesores

Este proyecto es una API REST escrita en Go utilizando el framework [Gin](https://gin-gonic.com/) y la base de datos PostgreSQL. Permite gestionar materias y profesores, proporcionando endpoints para crear, consultar y listar información.

🔗 **La aplicación ya está desplegada y puede accederse desde el navegador:**  
[https://api-isi.onrender.com](https://api-isi.onrender.com) 

## 📚 Funcionalidades

- Listado de materias (`GET /subjects`)
- Consulta de materia por ID (`GET /subjects/:id`)
- Listado de profesores (`GET /professors`)
- Consulta de profesor por ID (`GET /professors/:id`)

## 🧱 Tecnologías

- [Go (Golang)](https://golang.org/)
- [Gin Web Framework](https://github.com/gin-gonic/gin)
- [PostgreSQL](https://www.postgresql.org/)
- [pgx](https://github.com/jackc/pgx) para la conexión a la base de datos
- [Testify](https://github.com/stretchr/testify) para los tests
- [GitHub Actions](https://docs.github.com/actions) para CI/CD
- [Render](https://onrender.com) para despliegue
- [Docker](https://docker.com) para contener la aplicacion

## 📁 Estructura del Proyecto

```
web-service-gin/
├── main.go # Punto de entrada de la aplicación
├── main_test.go # Archivo de pruebas automatizadas
├── handlers/ # Lógica de los endpoints
│ ├── subjects.go
│ └── professors.go
├── go.mod / go.sum # Dependencias del proyecto
├── .env # Variables de entorno (no se sube al repo)
```


## 🛠️ Configuración

1. Clonar el repositorio:
```bash
git clone https://github.com/tu_usuario/web-service-gin.git
cd web-service-gin
```

2. Crear el archivo .env con la URL de tu base de datos:

```
DATABASE_URL=postgres://usuario:password@localhost:5432/tu_base_de_datos
```

3. Instalar las dependencias:

```
go mod tidy
```

4. Ejecutar la aplicación:

```
go run main.go
```

## 🧪 Pruebas

Asegurate de tener la base de datos accesible (con datos de prueba si es necesario).

Para correr los tests:

```
go test -v ./...
```

## 🚀 Despliegue

Este proyecto está preparado para integrarse con CI/CD utilizando GitHub Actions.
El proceso de despliegue se realiza automáticamente a Render al hacer un push a la rama principal.
Se recomienda definir la variable DATABASE_URL como Secret del repositorio para evitar exponer credenciales.

## 📌 Notas

- Se recomienda evitar correr pruebas sobre la base de datos de producción.
- Si agregás campos nuevos a las entidades, recordá actualizar tanto los handlers como los tests.

## 📧 Contacto

Para preguntas o mejoras, podés abrir un issue o enviar un PR.