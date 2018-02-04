-- Mauricio Rico Zavala / A01370874
-- Luis Barajas Perez / A01370934

CREATE TABLE user (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
  name VARCHAR(100) NOT NULL,
  residencia VARCHAR(300) NOT NULL,
  fecha_nacimiento TIMESTAMP,
  sys_start      TIMESTAMP(12) GENERATED ALWAYS AS ROW BEGIN NOT NULL,
  sys_end        TIMESTAMP(12) GENERATED ALWAYS AS ROW END NOT NULL,
  trans_start    TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID IMPLICITLY HIDDEN,
  period system_time (sys_start, sys_end)
)

CREATE TABLE user_history LIKE user;
ALTER TABLE user ADD VERSIONING USE HISTORY TABLE user_history;

CREATE TABLE auto (
  id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
  year INT NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  precio_factura DECIMAL(6,2) NOT NULL,
  no_motor VARCHAR(50) NOT NULL,
  no_serie VARCHAR(50) NOT NULL,
  user_id INT NOT NULL,
  constraint fk_user_id foreign key (user_id) references user (id) on delete restrict
)

CREATE TABLE poliza (
  folio VARCHAR(20) NOT NULL,
  tipo INT NOT NULL DEFAULT 1,
  costo DECIMAL(6,2) NOT NULL,
  fecha_inicio TIMESTAMP NOT NULL,
  fecha_fin TIMESTAMP NOT NULL,
  auto_id INT NOT NULL,
  sys_start      TIMESTAMP(12) GENERATED ALWAYS AS ROW BEGIN NOT NULL,
  sys_end        TIMESTAMP(12) GENERATED ALWAYS AS ROW END NOT NULL,
  trans_start    TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID IMPLICITLY HIDDEN,
  period system_time (sys_start, sys_end),
  constraint fk_auto_id foreign key (auto_id) references auto (id) on delete restrict
)

CREATE TABLE poliza_history LIKE poliza;
ALTER TABLE poliza ADD VERSIONING USE HISTORY TABLE poliza_history;

CREATE TRIGGER update_costo_poliza after update of fecha_fin on poliza
referencing new as new_values old as old_values
for each row mode db2sql
begin
atomic update poliza set costo = (old_values.costo / 365) * (days (new_values.fecha_fin) - days (new_values.fecha_inicio)) where folio = new_values.folio;
end

CREATE TRIGGER validate_tipo_poliza after update of tipo on poliza
referencing new as new_values old as old_values
for each row mode db2sql
when (new_values.tipo < old_values.tipo)
signal sqlstate '22005' set message_text='La poliza sólo se puede ampliar'

INSERT INTO user (name, residencia, fecha_nacimiento) VALUES ('Luis Barajas', 'Coyoacan', '1996-06-06');

INSERT INTO auto (year, modelo, precio_factura, no_motor, no_serie, user_id) VALUES (2018, 'Seat Leon', 350000, '897432knnkfjsd90832o', '80948231lkfjsa9', 1);

INSERT INTO poliza (folio, tipo, costo, fecha_inicio, fecha_fin, auto_id) VALUES ('98273k', 1, 12000, '2017-01-01', '2018-01-01', 1);

UPDATE user SET residencia = 'Santa Fe' WHERE id = 1;

SELECT residencia
FROM user
WHERE id = 1; -- direccion actualizada

SELECT residencia
FROM user_history
WHERE id = 1; -- todas las direcciones

UPDATE poliza SET tipo = 2 WHERE folio = '98273k';

UPDATE poliza SET tipo = 1 WHERE folio = '98273k'; -- error

UPDATE poliza SET fecha_fin = '2017-06-01' WHERE folio = '98273k'; -- costo a la mitad
