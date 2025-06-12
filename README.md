[![Feature Branches](https://github.com/universoparalelo/web-service-go/actions/workflows/feature.yml/badge.svg)](https://github.com/universoparalelo/web-service-go/actions/workflows/feature.yml)

[![Merges on Main Branch](https://github.com/universoparalelo/web-service-go/actions/workflows/main.yml/badge.svg)](https://github.com/universoparalelo/web-service-go/actions/workflows/main.yml)

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


## Como podes utilizar el proyecto?

### Utilizar los endpoint directamente

1. Obtener todas las materias (sin especificar las materias que se necesitan tener cursadas o aprobadas)
```bash
https://api-isi.onrender.com/subjects
```
2. Obtener una materia segun ID (especificada las materias que se necesitan tener cursadas o aprobadas)
```bash
https://api-isi.onrender.com/subjects/25
```
3. Obtener todos los profesores (ficticios)
```bash
https://api-isi.onrender.com/professors
```
4. Obtener un profesor (incluida la materia que dictan)
```bash
https://api-isi.onrender.com/professors/2
```

### Clonarlo y personalizarlo

1. Clonar el repositorio:
```bash
git clone https://github.com/tu_usuario/web-service-gin.git
cd web-service-gin
```

2. Instalar las dependencias:
```
go mod tidy
```

3. Debes crear un proyecto en NeonDB (recomendado) y obtener el string de connection

4. Crear el archivo .env con la URL de tu base de datos:

```
DATABASE_URL=postgres://usuario:password@localhost:5432/tu_base_de_datos
```

5. Cargar las estructuras de las tablas + datos -> definitionOfDB.sql

6. Ejecutar la aplicación:

```
go run main.go
```

### Utilizar la imagen en docker hub

1. Descargar la imagen (ya debes tener instalado docker en tu maquina)
```
docker pull cele618/api-isi:latest
```

2. Debes definir tu archivo para conectar con la base de datos sigue con los pasos para [Clonarlo y personalizarlo](#clonarlo-y-personalizarlo)

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
En el workflow se detallan muchas otras variables que pueden estar en secreto, recomendamos borrar los flujos que no se necesiten para tu proyecto o podes esperar que subamos los pasos para implementar este CI.
- DATABASE_URL: string de conexion con la base de datos
- GH_GITHUB: token de github
- RENDER_TOKEN: token de render
- TRELLO_TOKEN: token de trello
- DOCKER_TOKEN: token de docker
- TRELLO_ID_DONE: id de la tabla del done
- TRELLO_ID_EN_PROCESO: id de la tabla de en proceso


## 📌 Notas

- Se recomienda evitar correr pruebas sobre la base de datos de producción.
- Si agregás campos nuevos a las entidades, recordá actualizar tanto los handlers como los tests.

## 📧 Contacto

Para preguntas o mejoras, podés abrir un issue o enviar un PR.