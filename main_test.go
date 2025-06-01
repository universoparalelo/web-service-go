package main

import (
    "context"
    "net/http"
    "net/http/httptest"
    "testing"
    "log"
    "github.com/gin-gonic/gin"
    "os"
    "github.com/joho/godotenv"
    "github.com/jackc/pgx/v5"
    "github.com/stretchr/testify/assert"
    "example/web-service-gin/handlers"
)

var testDBConnString string

func TestMain(m *testing.M) {
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error cargando .env en los tests")
    }

    testDBConnString = os.Getenv("DATABASE_URL")
    if testDBConnString == "" {
        log.Fatal("DATABASE_URL no está definido en el entorno")
    }
    // Ejecutar los tests
    code := m.Run()
    os.Exit(code)
}

func getTestDB() *pgx.Conn {
    conn, err := pgx.Connect(context.Background(), testDBConnString)
    if err != nil {
        panic("No se pudo conectar a la base de datos: " + err.Error())
    }
    return conn
}

func setupRouter(db *pgx.Conn) *gin.Engine {
    router := gin.Default()
    router.GET("/subjects", handlers.GetAllSubjects(db))
    router.GET("/subjects/:id", handlers.GetSubjectByID(db))
    router.GET("/professors", handlers.GetAllProfessors(db))
    router.GET("/professors/:id", handlers.GetProfessorByID(db))
    return router
}

func TestGetSubjects(t *testing.T) {
    db := getTestDB()
    router := setupRouter(db)

    req, _ := http.NewRequest("GET", "/subjects", nil)
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)

    assert.Equal(t, http.StatusOK, w.Code)
}

func TestGetSubjectByID(t *testing.T) {
    db := getTestDB()
    router := setupRouter(db)

    // ✅ Cambiá este ID por uno que sepas que existe en tu base
    req, _ := http.NewRequest("GET", "/subjects/1", nil)
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)

    assert.Equal(t, http.StatusOK, w.Code)

    req, _ = http.NewRequest("GET", "/subjects/999", nil)
    w = httptest.NewRecorder()
    router.ServeHTTP(w, req)

    assert.Equal(t, http.StatusNotFound, w.Code)
}

func TestGetProfessors(t *testing.T) {
    db := getTestDB()
    router := setupRouter(db)

    req, _ := http.NewRequest("GET", "/professors", nil)
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)

    assert.Equal(t, http.StatusOK, w.Code)
}

func TestGetProfessorByID(t *testing.T) {
    db := getTestDB()
    router := setupRouter(db)

    // ✅ Cambiá este ID por uno real de tu base
    req, _ := http.NewRequest("GET", "/professors/1", nil)
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)

    assert.Equal(t, http.StatusOK, w.Code)

    req, _ = http.NewRequest("GET", "/professors/9999", nil)
    w = httptest.NewRecorder()
    router.ServeHTTP(w, req)

    assert.Equal(t, http.StatusNotFound, w.Code)
}
