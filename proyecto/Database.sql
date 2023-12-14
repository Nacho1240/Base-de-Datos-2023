CREATE TABLE usuarios (
id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rut VARCHAR(12) UNIQUE NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE eventos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL
);

CREATE TABLE candidatos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE candidatos_eventos (
    evento_id INT REFERENCES eventos(id),
    candidato_id INT REFERENCES candidatos(id),
    PRIMARY KEY (evento_id, candidato_id)
);

CREATE TABLE votos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    evento_id INT REFERENCES eventos(id),
    fecha_voto TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);





