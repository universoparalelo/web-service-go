package main

import (
    "net/http"
    "net/http/httptest"
    "testing"
    "github.com/stretchr/testify/assert"
	"strings"
    "github.com/gin-gonic/gin"
)

func TestGetSubjects(t *testing.T) {
    router := setupRouter()
    
    req, _ := http.NewRequest("GET", "/subjects", nil)
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusOK, w.Code)
    // Aquí podrías añadir más assertions sobre el cuerpo de la respuesta
}

func TestGetSubjectByID(t *testing.T) {
    router := setupRouter()
    
    // Test caso existente
    req, _ := http.NewRequest("GET", "/subjects/1", nil)
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusOK, w.Code)
    
    // Test caso no existente
    req, _ = http.NewRequest("GET", "/subjects/999", nil)
    w = httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusNotFound, w.Code)
}

func TestPostSubjects(t *testing.T) {
    router := setupRouter()
    
    // Crear un nuevo subject de prueba
    newSubject := `{
        "id": "10",
        "name": "Nueva Materia",
        "year": 3,
        "anual": false,
        "semester": 1
    }`
    
    req, _ := http.NewRequest("POST", "/subjects", strings.NewReader(newSubject))
    req.Header.Set("Content-Type", "application/json")
    
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusCreated, w.Code)
    
    // Verificar que se añadió
    req, _ = http.NewRequest("GET", "/subjects/10", nil)
    w = httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusOK, w.Code)
}

func TestGetSProfessors(t *testing.T) {
    router := setupRouter()
    
    req, _ := http.NewRequest("GET", "/professors", nil)
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusOK, w.Code)
    // Aquí podrías añadir más assertions sobre el cuerpo de la respuesta
}

func TestGetProfessorByID(t *testing.T) {
    router := setupRouter()
    
    // Test caso existente
    req, _ := http.NewRequest("GET", "/professors/1", nil)
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusOK, w.Code)
    
    // Test caso no existente
    req, _ = http.NewRequest("GET", "/professors/999", nil)
    w = httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusNotFound, w.Code)
}

func TestPostProfessors(t *testing.T) {
    router := setupRouter()
    
    // Crear un nuevo subject de prueba
    newSubject := `{
        "id": "10",
        "name": "Nuevo Profesor",
        "email": "profesor10@gmail.com",
        "phone": "1234567890"
    }`
    
    req, _ := http.NewRequest("POST", "/professors", strings.NewReader(newSubject))
    req.Header.Set("Content-Type", "application/json")
    
    w := httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusCreated, w.Code)
    
    // Verificar que se añadió
    req, _ = http.NewRequest("GET", "/professors/10", nil)
    w = httptest.NewRecorder()
    router.ServeHTTP(w, req)
    
    assert.Equal(t, http.StatusOK, w.Code)
}

func setupRouter() *gin.Engine {
    router := gin.Default()
    router.GET("/subjects", getSubjects)
    router.GET("/subjects/:id", getSubjectByID)
    router.POST("/subjects", postSubjects)
    router.GET("/professors", getProfessors)
    router.GET("/professors/:id", getProfessorByID)
    router.POST("/professors", postProfessors)
    return router
}



