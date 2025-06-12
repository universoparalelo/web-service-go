package main

import (
	"context"
	"example/web-service-gin/handlers"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/jackc/pgx/v5"
	"github.com/joho/godotenv"
)

var DB *pgx.Conn

func main() {
	var i = 0
	_ = godotenv.Load() // no falla si no existe

	connStr := os.Getenv("DATABASE_URL")
	if connStr == "" {
		log.Fatal("Error: la variable de entorno DATABASE_URL no está definida")
	}

	var err error
	DB, err = pgx.Connect(context.Background(), connStr)
	if err != nil {
		log.Fatal("Error conectando a la base de datos:", err)
	}
	defer DB.Close(context.Background())

	r := gin.Default()
	r.SetTrustedProxies(nil)

	r.GET("/subjects", handlers.GetAllSubjects(DB))
	r.GET("/subjects/:id", handlers.GetSubjectByID(DB))

	r.GET("/professors", handlers.GetAllProfessors(DB))
	r.GET("/professors/:id", handlers.GetProfessorByID(DB))

	port := os.Getenv("PORT")
	if port == "" {
		port = "8081" // por si ejecutás localmente
	}
	r.Run(":" + port)

}
