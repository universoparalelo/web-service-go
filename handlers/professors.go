package handlers

import (
    "context"
    "net/http"
    "strconv"

    "github.com/gin-gonic/gin"
    "github.com/jackc/pgx/v5"
)

func GetAllProfessors(db *pgx.Conn) gin.HandlerFunc {
    return func(c *gin.Context) {
        rows, err := db.Query(context.Background(), `
            SELECT id, name, email FROM professors
        `)
        if err != nil {
            c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
            return
        }
        defer rows.Close()

        var professors []Professor
        for rows.Next() {
            var s Professor
            var id int
            err := rows.Scan(&id, &s.Name, &s.Email)
            if err != nil {
                c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
                return
            }
            s.ID = strconv.Itoa(id)

            // Podés agregar aquí correlativas y profesores si querés incluir todo de una
            professors = append(professors, s)
        }

        c.JSON(http.StatusOK, professors)
    }
}

func GetProfessorByID(db *pgx.Conn) gin.HandlerFunc {
    return func(c *gin.Context) {
        id := c.Param("id")

        var s Professor
        err := db.QueryRow(context.Background(), `
            SELECT id, name, email FROM professors WHERE id = $1
        `, id).Scan(&id, &s.Name, &s.Email)
        if err != nil {
            c.JSON(http.StatusNotFound, gin.H{"error": "Profesor no encontrada"})
            return
        }
        s.ID = id

        // Materias
        subjRows, _ := db.Query(context.Background(), `
            SELECT s.id, s.name, s.year
            FROM subjects s
            JOIN subject_professor sp ON sp.subject_id = s.id
            WHERE sp.professor_id = $1
        `, id)
        defer subjRows.Close()
		
        for subjRows.Next() {
			var p Subject
            var pid int
            subjRows.Scan(&pid, &p.Name, &p.Year)
            p.ID = strconv.Itoa(pid)
            s.Subjects = append(s.Subjects, p)
        }

        c.JSON(http.StatusOK, s)
    }
}