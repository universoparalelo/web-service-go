package handlers

import (
    "context"
    "net/http"
    "strconv"

    "github.com/gin-gonic/gin"
    "github.com/jackc/pgx/v5"
)

type Subject struct {
    ID                   string     `json:"id"`
    Name                 string     `json:"name"`
    Year                 int        `json:"year"`
    Dictated             string     `json:"dictated"`
    CorrelativesCoursed  []Subject  `json:"correlatives_coursed"`
    CorrelativesApproved []Subject  `json:"correlatives_approved"`
    Professors           []Professor `json:"professors"`
}

type Professor struct {
    ID    		string   	`json:"id"`
    Name  		string   	`json:"name"`
    Email 		string   	`json:"email"`
    Phone 		string   	`json:"phone"`
	Subjects  	[]Subject  	`json:"subjects"`
}

func GetAllSubjects(db *pgx.Conn) gin.HandlerFunc {
    return func(c *gin.Context) {
        rows, err := db.Query(context.Background(), `
            SELECT id, name, dictated, year FROM subjects
        `)
        if err != nil {
            c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
            return
        }
        defer rows.Close()

        var subjects []Subject
        for rows.Next() {
            var s Subject
            var id int
            err := rows.Scan(&id, &s.Name, &s.Dictated, &s.Year)
            if err != nil {
                c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
                return
            }
            s.ID = strconv.Itoa(id)

            // Podés agregar aquí correlativas y profesores si querés incluir todo de una
            subjects = append(subjects, s)
        }

        c.JSON(http.StatusOK, subjects)
    }
}

func GetSubjectByID(db *pgx.Conn) gin.HandlerFunc {
    return func(c *gin.Context) {
        id := c.Param("id")

        var s Subject
        err := db.QueryRow(context.Background(), `
            SELECT id, name, dictated, year FROM subjects WHERE id = $1
        `, id).Scan(&id, &s.Name, &s.Dictated, &s.Year)
        if err != nil {
            c.JSON(http.StatusNotFound, gin.H{"error": "Materia no encontrada"})
            return
        }
        s.ID = id

        // Profesores
        profRows, _ := db.Query(context.Background(), `
            SELECT p.id, p.name, p.email
            FROM professors p
            JOIN subject_professor sp ON sp.professor_id = p.id
            WHERE sp.subject_id = $1
        `, id)
        defer profRows.Close()
		
        for profRows.Next() {
			var p Professor
            var pid int
            profRows.Scan(&pid, &p.Name, &p.Email)
            p.ID = strconv.Itoa(pid)
            s.Professors = append(s.Professors, p)
        }

        // Correlativas cursadas
        courseRows, _ := db.Query(context.Background(), `
            SELECT s.id, s.name, s.dictated, s.year
            FROM correlatives_coursed c
            JOIN subjects s ON s.id = c.requires_subject_id
            WHERE c.subject_id = $1
        `, id)
        defer courseRows.Close()
        for courseRows.Next() {
            var sc Subject
            var scid int
            courseRows.Scan(&scid, &sc.Name, &sc.Dictated, &sc.Year)
            sc.ID = strconv.Itoa(scid)
            s.CorrelativesCoursed = append(s.CorrelativesCoursed, sc)
        }

        // Correlativas aprobadas
        approvedRows, _ := db.Query(context.Background(), `
            SELECT s.id, s.name, s.dictated, s.year
            FROM correlatives_approved c
            JOIN subjects s ON s.id = c.requires_subject_id
            WHERE c.subject_id = $1
        `, id)
        defer approvedRows.Close()
        for approvedRows.Next() {
            var sa Subject
            var said int
            approvedRows.Scan(&said, &sa.Name, &sa.Dictated, &sa.Year)
            sa.ID = strconv.Itoa(said)
            s.CorrelativesApproved = append(s.CorrelativesApproved, sa)
        }

        c.JSON(http.StatusOK, s)
    }
}
