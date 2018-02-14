DELIMITER $$
CREATE PROCEDURE modify_film_title()
BEGIN
    declare id int;
    declare category_name VARCHAR(25);    
    declare film_title VARCHAR(255);         
    declare done int default FALSE;
    DECLARE modify_title cursor for SELECT film.title, category.name, film.film_id from category inner join film_category on category.category_id = film_category.category_id inner join film on film_category.film_id = film.film_id;
    declare continue handler
		for not found
        set done = true;
    open modify_title;
    read_loop: loop
		fetch modify_title into film_title, category_name, id;
        if done then
			leave read_loop;
		end if; 
        update film set title = concat(category_name, "_", film_title) where film_id = id;
	end loop;
    close modify_title;
END$$
DELIMITER ;