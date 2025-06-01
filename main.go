package main

import (
    "context"
    "log"
    "os"

    "github.com/gin-gonic/gin"
    "github.com/joho/godotenv"
    "github.com/jackc/pgx/v5"
    "example/web-service-gin/handlers"
)

var DB *pgx.Conn

func main() {
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error cargando .env")
    }

    connStr := os.Getenv("DATABASE_URL")
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

    r.Run(":8080")
}
