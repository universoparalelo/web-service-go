CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    anual BOOLEAN NOT NULL,
    semester INTEGER CHECK (semester BETWEEN 1 AND 2)
);

CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT,
    email TEXT UNIQUE
);


CREATE TABLE subject_professor (
    subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
    professor_id INTEGER REFERENCES professors(id) ON DELETE CASCADE,
    PRIMARY KEY (subject_id, professor_id)
);


CREATE TABLE correlatives_coursed (
    subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
    requires_subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
    PRIMARY KEY (subject_id, requires_subject_id)
);


CREATE TABLE correlatives_approved (
    subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
    requires_subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
    PRIMARY KEY (subject_id, requires_subject_id)
);

-- data
INSERT INTO subjects (id, name, year, dictated) VALUES (1, 'Análisis Matemático I', 1, 'anual');
INSERT INTO subjects (id, name, year, dictated) VALUES (2, 'Álgebra y Geometría Analítica', 1, 'anual');
INSERT INTO subjects (id, name, year, dictated) VALUES (3, 'Física I', 1, 'anual');
INSERT INTO subjects (id, name, year, dictated) VALUES (4, 'Inglés I', 1, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (5, 'Lógica y Estructuras Discretas', 1, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (6, 'Algoritmos y Estructuras de Datos', 1, 'anual');
INSERT INTO subjects (id, name, year, dictated) VALUES (7, 'Arquitectura de Computadoras', 1, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (8, 'Sistemas y Procesos de Negocio', 1, 'anual');


INSERT INTO subjects (id, name, year, dictated) VALUES (9, 'Análisis Matemático II', 2, 'anual');
INSERT INTO subjects (id, name, year, dictated) VALUES (10, 'Física II', 2, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (11, 'Ingeniería y Sociedad', 2, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (12, 'Inglés II', 2, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (13, 'Sintaxis y Semántica de los Lenguajes', 2, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (14, 'Paradigmas de Programación', 2, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (15, 'Sistemas Operativos', 2, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (16, 'Análisis de Sistemas de Información', 2, 'anual');


INSERT INTO subjects (id, name, year, dictated) VALUES (17, 'Probabilidad y Estadística', 3, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (18, 'Economía', 3, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (19, 'Bases de Datos', 3, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (20, 'Desarrollo de Software', 3, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (21, 'Comunicación de Datos', 3, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (22, 'Análisis Numérico', 3, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (23, 'Diseño de Sistemas de Información', 3, 'anual');


INSERT INTO subjects (id, name, year, dictated) VALUES (24, 'Legislación', 4, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (25, 'Ingeniería y Calidad de Software', 4, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (26, 'Redes de Datos', 4, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (27, 'Investigación Operativa', 4, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (28, 'Simulación', 4, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (29, 'Tecnologías para la Automatización', 4, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (30, 'Administración de Sistemas de Información', 4, 'anual');
INSERT INTO subjects (id, name, year, dictated) VALUES (31, 'Inteligencia Artificial', 5, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (32, 'Ciencia de Datos', 5, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (33, 'Sistemas de Gestión', 5, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (34, 'Gestión Gerencial', 5, '1c');
INSERT INTO subjects (id, name, year, dictated) VALUES (35, 'Seguridad en los Sistemas de Información', 5, '2c');
INSERT INTO subjects (id, name, year, dictated) VALUES (36, 'Proyecto Final', 5, 'anual');


-- Insert professors
INSERT INTO professors (id, name, email) VALUES (1, 'Laura Fernández', 'laura.fernández63@facultad.org');
INSERT INTO professors (id, name, email) VALUES (2, 'Clara Vega', 'clara.vega20@facultad.org');
INSERT INTO professors (id, name, email) VALUES (3, 'Pedro Sánchez', 'pedro.sánchez23@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (4, 'José López', 'josé.lópez27@facultad.org');
INSERT INTO professors (id, name, email) VALUES (5, 'Laura Fernández', 'laura.fernández61@facultad.org');
INSERT INTO professors (id, name, email) VALUES (6, 'José López', 'josé.lópez56@univ.edu');
INSERT INTO professors (id, name, email) VALUES (7, 'Camila Ruiz', 'camila.ruiz37@univ.edu');
INSERT INTO professors (id, name, email) VALUES (8, 'Luis Gómez', 'luis.gómez48@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (9, 'Marta Rodríguez', 'marta.rodríguez73@univ.edu');
INSERT INTO professors (id, name, email) VALUES (10, 'Pablo Ramírez', 'pablo.ramírez62@facultad.org');
INSERT INTO professors (id, name, email) VALUES (11, 'Luis Gómez', 'luis.gómez43@univ.edu');
INSERT INTO professors (id, name, email) VALUES (12, 'Pedro Sánchez', 'pedro.sánchez96@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (13, 'Marta Rodríguez', 'marta.rodríguez56@facultad.org');
INSERT INTO professors (id, name, email) VALUES (14, 'Diego Martínez', 'diego.martínez55@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (15, 'Luis Gómez', 'luis.gómez20@facultad.org');
INSERT INTO professors (id, name, email) VALUES (16, 'José López', 'josé.lópez37@facultad.org');
INSERT INTO professors (id, name, email) VALUES (17, 'Marta Rodríguez', 'marta.rodríguez67@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (18, 'Diego Martínez', 'diego.martínez75@facultad.org');
INSERT INTO professors (id, name, email) VALUES (19, 'Pedro Sánchez', 'pedro.sánchez68@facultad.org');
INSERT INTO professors (id, name, email) VALUES (20, 'Marta Rodríguez', 'marta.rodríguez89@facultad.org');
INSERT INTO professors (id, name, email) VALUES (21, 'Clara Vega', 'clara.vega53@facultad.org');
INSERT INTO professors (id, name, email) VALUES (22, 'Pedro Sánchez', 'pedro.sánchez40@univ.edu');
INSERT INTO professors (id, name, email) VALUES (23, 'Marta Rodríguez', 'marta.rodríguez1@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (24, 'José López', 'josé.lópez60@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (25, 'Ana Torres', 'ana.torres51@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (26, 'Laura Fernández', 'laura.fernández1@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (27, 'Pablo Ramírez', 'pablo.ramírez28@univ.edu');
INSERT INTO professors (id, name, email) VALUES (28, 'Camila Ruiz', 'camila.ruiz21@univ.edu');
INSERT INTO professors (id, name, email) VALUES (29, 'Luis Gómez', 'luis.gómez52@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (30, 'Marta Rodríguez', 'marta.rodríguez56@facultad.org');
INSERT INTO professors (id, name, email) VALUES (31, 'José López', 'josé.lópez81@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (32, 'Camila Ruiz', 'camila.ruiz97@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (33, 'Clara Vega', 'clara.vega44@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (34, 'Marta Rodríguez', 'marta.rodríguez46@facultad.org');
INSERT INTO professors (id, name, email) VALUES (35, 'Pedro Sánchez', 'pedro.sánchez62@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (36, 'Pablo Ramírez', 'pablo.ramírez83@facultad.org');
INSERT INTO professors (id, name, email) VALUES (37, 'Pablo Ramírez', 'pablo.ramírez84@univ.edu');
INSERT INTO professors (id, name, email) VALUES (38, 'Clara Vega', 'clara.vega96@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (39, 'José López', 'josé.lópez38@facultad.org');
INSERT INTO professors (id, name, email) VALUES (40, 'Pedro Sánchez', 'pedro.sánchez32@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (41, 'Clara Vega', 'clara.vega55@univ.edu');
INSERT INTO professors (id, name, email) VALUES (42, 'Pablo Ramírez', 'pablo.ramírez61@univ.edu');
INSERT INTO professors (id, name, email) VALUES (43, 'Luis Gómez', 'luis.gómez75@facultad.org');
INSERT INTO professors (id, name, email) VALUES (44, 'Luis Gómez', 'luis.gómez99@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (45, 'Laura Fernández', 'laura.fernández23@facultad.org');
INSERT INTO professors (id, name, email) VALUES (46, 'Luis Gómez', 'luis.gómez71@univ.edu');
INSERT INTO professors (id, name, email) VALUES (47, 'Ana Torres', 'ana.torres25@facultad.org');
INSERT INTO professors (id, name, email) VALUES (48, 'Luis Gómez', 'luis.gómez95@facultad.org');
INSERT INTO professors (id, name, email) VALUES (49, 'Camila Ruiz', 'camila.ruiz9@facultad.org');
INSERT INTO professors (id, name, email) VALUES (50, 'Laura Fernández', 'laura.fernández69@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (51, 'Camila Ruiz', 'camila.ruiz8@facultad.org');
INSERT INTO professors (id, name, email) VALUES (52, 'Laura Fernández', 'laura.fernández61@facultad.org');
INSERT INTO professors (id, name, email) VALUES (53, 'Pablo Ramírez', 'pablo.ramírez39@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (54, 'José López', 'josé.lópez95@univ.edu');
INSERT INTO professors (id, name, email) VALUES (55, 'Luis Gómez', 'luis.gómez45@univ.edu');
INSERT INTO professors (id, name, email) VALUES (56, 'Clara Vega', 'clara.vega36@facultad.org');
INSERT INTO professors (id, name, email) VALUES (57, 'Marta Rodríguez', 'marta.rodríguez43@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (58, 'Luis Gómez', 'luis.gómez44@facultad.org');
INSERT INTO professors (id, name, email) VALUES (59, 'Luis Gómez', 'luis.gómez32@facultad.org');
INSERT INTO professors (id, name, email) VALUES (60, 'Camila Ruiz', 'camila.ruiz33@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (61, 'Luis Gómez', 'luis.gómez41@facultad.org');
INSERT INTO professors (id, name, email) VALUES (62, 'Clara Vega', 'clara.vega79@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (63, 'Pablo Ramírez', 'pablo.ramírez56@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (64, 'Laura Fernández', 'laura.fernández77@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (65, 'José López', 'josé.lópez82@univ.edu');
INSERT INTO professors (id, name, email) VALUES (66, 'Camila Ruiz', 'camila.ruiz13@univ.edu');
INSERT INTO professors (id, name, email) VALUES (67, 'Clara Vega', 'clara.vega97@utn.edu.ar');
INSERT INTO professors (id, name, email) VALUES (68, 'Pablo Ramírez', 'pablo.ramírez20@univ.edu');
INSERT INTO professors (id, name, email) VALUES (69, 'Pedro Sánchez', 'pedro.sánchez58@univ.edu');
INSERT INTO professors (id, name, email) VALUES (70, 'Laura Fernández', 'laura.fernández40@univ.edu');
INSERT INTO professors (id, name, email) VALUES (71, 'Clara Vega', 'clara.vega15@univ.edu');
INSERT INTO professors (id, name, email) VALUES (72, 'Pablo Ramírez', 'pablo.ramírez74@facultad.org');
INSERT INTO professors (id, name, email) VALUES (73, 'Ana Torres', 'ana.torres35@facultad.org');
INSERT INTO professors (id, name, email) VALUES (74, 'José López', 'josé.lópez72@univ.edu');


-- Insert subject_professor
INSERT INTO subject_professor (subject_id, professor_id) VALUES (1, 1);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (1, 2);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (2, 3);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (2, 4);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (3, 5);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (3, 6);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (4, 7);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (4, 8);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (5, 9);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (5, 10);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (6, 11);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (6, 12);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (7, 13);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (7, 14);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (8, 15);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (8, 16);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (9, 17);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (9, 18);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (10, 19);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (10, 20);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (11, 21);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (11, 22);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (12, 23);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (12, 24);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (13, 25);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (13, 26);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (14, 27);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (14, 28);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (15, 29);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (15, 30);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (16, 31);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (16, 32);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (17, 33);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (17, 34);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (18, 35);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (18, 36);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (19, 37);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (19, 38);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (20, 39);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (20, 40);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (21, 41);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (21, 42);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (22, 43);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (22, 44);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (23, 45);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (23, 46);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (24, 47);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (24, 48);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (25, 49);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (25, 50);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (26, 51);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (26, 52);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (27, 53);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (27, 54);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (28, 55);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (28, 56);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (29, 57);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (29, 58);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (30, 59);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (30, 60);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (31, 61);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (31, 62);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (32, 63);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (32, 64);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (33, 65);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (33, 66);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (34, 67);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (34, 68);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (35, 69);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (35, 70);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (36, 71);
INSERT INTO subject_professor (subject_id, professor_id) VALUES (36, 72);


INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (9, 1);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (9, 2);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (10, 1);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (10, 3);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (12, 4);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (13, 5);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (13, 6);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (14, 5);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (14, 6);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (15, 7);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (16, 8);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (17, 1);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (17, 2);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (19, 13);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (19, 16);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (20, 14);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (20, 16);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (22, 9);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (23, 14);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (23, 16);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (24, 11);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (25, 19);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (25, 20);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (25, 23);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (26, 15);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (26, 21);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (27, 17);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (27, 22);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (28, 17);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (29, 10);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (29, 22);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (30, 18);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (30, 23);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (31, 28);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (32, 28);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (33, 18);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (33, 27);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (34, 24);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (34, 30);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (35, 26);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (35, 30);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (36, 25);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (36, 26);
INSERT INTO correlatives_coursed (subject_id, requires_subject_id) VALUES (36, 30);


INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (18, 1);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (18, 2);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (19, 5);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (19, 6);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (20, 5);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (20, 6);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (21, 3);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (21, 7);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (22, 1);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (22, 2);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (23, 4);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (23, 6);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (23, 8);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (25, 13);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (25, 14);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (28, 9);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (29, 9);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (30, 16);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (31, 17);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (31, 22);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (32, 17);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (32, 19);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (33, 23);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (34, 18);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (35, 20);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (35, 21);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (36, 12);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (36, 20);
INSERT INTO correlatives_approved (subject_id, requires_subject_id) VALUES (36, 23);