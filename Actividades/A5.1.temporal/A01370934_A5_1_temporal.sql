-- Mauricio Rico Zavala / A01370874
-- Luis Barajas Perez / A01370934

CREATE TABLE user (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
  name VARCHAR(100) NOT NULL,
  residencia VARCHAR(300) NOT NULL,
  fecha_nacimiento TIMESTAMP
)

CREATE TABLE poliza (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
  tipo INT NOT NULL DEFAULT 1,
  costo DECIMAL(6,2) NOT NULL,
  fecha_inicio TIMESTAMP NOT NULL,
  fecha_fin TIMESTAMP NOT NULL,
  period business_time(fecha_inicio, fecha_fin)
)
