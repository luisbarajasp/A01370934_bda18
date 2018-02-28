-- Paso 2: Crear LOG_FILM
CREATE TABLE LOG_FILM (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 tipo VARCHAR(45) DEFAULT "UPDATE",
 film_id smallint(5) unsigned,
 last_value VARCHAR(50),
 new_value VARCHAR(50),
 created_at timestamp DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (film_id) REFERENCES film(film_id)
);

-- Paso 3: Stored procedure
DELIMITER //
CREATE PROCEDURE `createLOG_FILM` (
 film_id smallint(5) ,
 last_value VARCHAR(50),
 new_value VARCHAR(50)
)
BEGIN
INSERT INTO `sakila`.`LOG_FILM`
(`film_id`,
`last_value`,
`new_value`)
VALUES
(film_id,
last_value,
new_value);

END //

DELIMITER ;

-- Paso 4: Trigger update en film
DELIMITER ///

CREATE TRIGGER update_film AFTER UPDATE ON film
    FOR EACH ROW
    BEGIN
		call createLOG_FILM(NEW.film_id, OLD.original_language_id, NEW.original_language_id);
    END;
///

DELIMITER ;

-- Paso 5: Cursor para original_language

DELIMITER $$
CREATE PROCEDURE modify_film_original_language()
BEGIN
    declare id int;
    declare language_id tinyint(3);         
    declare done int default FALSE;
    DECLARE italian_movies cursor for SELECT film_category.film_id from category inner join film_category on category.category_id = film_category.category_id where category.name = "Documentary";
    DECLARE japanese_movies cursor for SELECT film_category.film_id from category inner join film_category on category.category_id = film_category.category_id where category.name = "Foreign";
    DECLARE german_movies cursor for SELECT film_actor.film_id from actor inner join film_actor on actor.actor_id = film_actor.actor_id where actor.first_name = "SISSY" AND actor.last_name = "SOBIESKI";
    DECLARE mandarin_movies cursor for SELECT film_actor.film_id from actor inner join film_actor on actor.actor_id = film_actor.actor_id where actor.first_name = "ED" AND actor.last_name = "CHASE";
    DECLARE french_movies cursor for SELECT film_actor.film_id from actor inner join film_actor on actor.actor_id = film_actor.actor_id where actor.first_name = "AUDREY" AND actor.last_name = "OLIVIER";
    DECLARE english_movies cursor for SELECT film_id FROM film where original_language_id IS null;
    declare continue handler
		for not found
        set done = true;
        
	-- Italian movies
    open italian_movies;
    read_loop: loop
		fetch italian_movies into id;
        set language_id = 2;
        if done then
			leave read_loop;
		end if; 
        update film set original_language_id = language_id where film_id = id;
	end loop;
    close italian_movies;
    set done = false;
    
    -- japanese movies
    open japanese_movies;
    read_loop: loop
		fetch japanese_movies into id;
        set language_id = 3;
        if done then
			leave read_loop;
		end if; 
        update film set original_language_id = language_id where film_id = id;
	end loop;
    close japanese_movies;
    set done = false;
    
     -- german movies
    open german_movies;
    read_loop: loop
		fetch german_movies into id;
        set language_id = 6;
        if done then
			leave read_loop;
		end if; 
        update film set original_language_id = language_id where film_id = id;
	end loop;
    close german_movies;
    set done = false;
    
     -- mandarin movies
    open mandarin_movies;
    read_loop: loop
		fetch mandarin_movies into id;
        set language_id = 4;
        if done then
			leave read_loop;
		end if; 
        update film set original_language_id = language_id where film_id = id;
	end loop;
    close mandarin_movies;
    set done = false;
    
    -- french movies
    open french_movies;
    read_loop: loop
		fetch french_movies into id;
        set language_id = 5;
        if done then
			leave read_loop;
		end if; 
        update film set original_language_id = language_id where film_id = id;
	end loop;
    close french_movies;
    set done = false;
    
    -- english movies
    open english_movies;
    read_loop: loop
		fetch english_movies into id;
        set language_id = 1;
        if done then
			leave read_loop;
		end if; 
        update film set original_language_id = language_id where film_id = id;
	end loop;
    close english_movies;
    set done = false;
    
END$$
DELIMITER ;

-- Paso 6: DB2

CREATE TABLE gomita (nombre VARCHAR(100) NOT NULL, precio DECIMAL(6,2) NOT NULL, fecha_inicio TIMESTAMP NOT NULL, fecha_fin TIMESTAMP NOT NULL, PERIOD business_time(fecha_inicio, fecha_fin))

INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita1', 5.00, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita2', 2.50, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita3', 5.70, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita4', 10.33, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita5', 6.65, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita6', 7.10, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita7', 3.40, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita8', 5.10, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita9', 10.23, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita10', 3.20, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita11', 4.50, '2018-01-01', '2019-01-01')
INSERT INTO gomita (nombre, precio, fecha_inicio, fecha_fin) VALUES ('Gomita12', 15.78, '2018-01-01', '2019-01-01')

UPDATE gomita for portion of business_time from '2018-02-01' to '2019-01-01' set precio = (precio * 1.45)
UPDATE gomita for portion of business_time from '2018-02-15' to '2019-01-01' set precio = ((precio/1.45) * 1.10)
UPDATE gomita for portion of business_time from '2018-04-25' to '2019-01-01' set precio = (precio * 1.45)
UPDATE gomita for portion of business_time from '2018-05-05' to '2019-01-01' set precio = ((precio/1.45) * 1.10)
UPDATE gomita for portion of business_time from '2018-10-25' to '2019-01-01' set precio = (precio * 1.45)
UPDATE gomita for portion of business_time from '2018-11-05' to '2019-01-01' set precio = ((precio/1.45) * 1.10)

SELECT * from gomita WHERE nombre ='Gomita1'

SELECT SUM(precio)/COUNT(*) as promedio from gomita WHERE nombre = 'Gomita1'
SELECT MAX(precio) as precio_alto from gomita WHERE nombre = 'Gomita1'
SELECT MIN(precio) as precio_bajo from gomita WHERE nombre = 'Gomita1'