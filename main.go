package main

import (
    "net/http"
    "github.com/gin-gonic/gin"
)

type professor struct {
    ID     string  `json:"id"`
    Name  string  `json:"name"`
    Email string  `json:"email"`
	Phone string  `json:"phone"`
	Subjects []subject `json:"correlatives"`
}

// subject represents data about a record subject.
type subject struct {
    ID     string  `json:"id"`
    Name  string  `json:"name"`
    Year int  `json:"year"`
	Anual  bool `json:"anual"`
    Semester  int `json:"semester"`
	Correlatives []subject `json:"correlatives"`
	Professors []professor `json:"professors"`
}

func main() {
    router := gin.Default()
    router.GET("/subjects", getSubjects)
	router.GET("/subjects/:id", getSubjectByID)
	router.POST("/subjects", postSubjects)

    router.GET("/professors", getProfessors)
	router.GET("/professors/:id", getProfessorByID)
	router.POST("/professors", postProfessors)

    router.Run("localhost:8080")
}

// subjects slice to seed record subject data.
var subjects = []subject{
    {ID: "1", Name: "Algoritmos y estructuras de datos", Year: 1, Anual: true, Professors: []professor{{ID: "1", Name: "Juan Perez"}}},
    {ID: "2", Name: "Sistemas y Procesos de Negocio", Year: 1, Anual: true, Professors: []professor{{ID: "2", Name: "Maria Lopez"}}},
    {ID: "3", Name: "Analisis Matematico 1", Year: 1, Anual: true, Professors: []professor{{ID: "3", Name: "Carlos Gomez"}}},
	{ID: "4", Name: "Algebra", Year: 1, Anual: true, Professors: []professor{{ID: "3", Name: "Carlos Gomez"}}},
	{ID: "5", Name: "Matematica discreta", Year: 1, Anual: false, Semester: 1},
	{ID: "6", Name: "Fisica 1", Year: 1, Anual: true},
	{ID: "7", Name: "Analisis Matematico 2", Year: 2, Anual: true, Correlatives: []subject{{ID: "3", Name: "Analisis Matematico 1"}, {ID: "4", Name: "Algebra"}}},
}

var professors = []professor{
	{ID: "1", Name: "Juan Perez", Email: "juan@gmail.com", Phone: "1234567890", Subjects: []subject{{ID: "1", Name: "Algoritmos y estructuras de datos"}}},
	{ID: "2", Name: "Maria Lopez", Email: "maria@gmail.com", Phone: "0987654321", Subjects: []subject{{ID: "2", Name: "Sistemas y Procesos de Negocio"}}},
	{ID: "3", Name: "Carlos Gomez", Email: "carlos@gmail.com", Phone: "1122334455", Subjects: []subject{{ID: "3", Name: "Analisis Matematico 1"}, {ID: "4", Name: "Algebra"}}},
}

// getSubjects responds with the list of all Subjects as JSON.
func getSubjects(c *gin.Context) {
    c.IndentedJSON(http.StatusOK, subjects)
}

func getProfessors(c *gin.Context) {
    c.IndentedJSON(http.StatusOK, professors)
}

// postSubjects adds an subject from JSON received in the request body.
func postSubjects(c *gin.Context) {
    var newSubject subject

    // Call BindJSON to bind the received JSON to
    // newSubject.
    if err := c.BindJSON(&newSubject); err != nil {
        return
    }

    // Add the new subject to the slice.
    subjects = append(subjects, newSubject)
    c.IndentedJSON(http.StatusCreated, newSubject)
}

func postProfessors(c *gin.Context) {
    var newProfessor professor

    // Call BindJSON to bind the received JSON to
    // newSubject.
    if err := c.BindJSON(&newProfessor); err != nil {
        return
    }

    // Add the new subject to the slice.
    professors = append(professors, newProfessor)
    c.IndentedJSON(http.StatusCreated, newProfessor)
}


// getSubjectByID locates the subject whose ID value matches the id
// parameter sent by the client, then returns that subject as a response.
func getSubjectByID(c *gin.Context) {
    id := c.Param("id")

    // Loop over the list of albums, looking for
    // an album whose ID value matches the parameter.
    for _, a := range subjects {
        if a.ID == id {
            c.IndentedJSON(http.StatusOK, a)
            return
        }
    }
    c.IndentedJSON(http.StatusNotFound, gin.H{"message": "subject not found"})
}

func getProfessorByID(c *gin.Context) {
    id := c.Param("id")

    for _, a := range professors {
        if a.ID == id {
            c.IndentedJSON(http.StatusOK, a)
            return
        }
    }
    c.IndentedJSON(http.StatusNotFound, gin.H{"message": "Professor not found"})
}