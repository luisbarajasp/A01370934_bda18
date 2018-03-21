/* 1.- Por ZipCode */

var mapZip = function(){
    emit(this.address.zipcode, 1);
}

var countPerZP = function(zipCode, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(mapZip, countPerZP, {out:"perZp"}).find();

/* Return

{ "_id" : "", "value" : 1 }
{ "_id" : "07005", "value" : 1 }
{ "_id" : "10000", "value" : 1 }
{ "_id" : "10001", "value" : 520 }
{ "_id" : "10002", "value" : 471 }
{ "_id" : "10003", "value" : 686 }
{ "_id" : "10004", "value" : 131 }
{ "_id" : "10005", "value" : 69 }
{ "_id" : "10006", "value" : 47 }
{ "_id" : "10007", "value" : 135 }
{ "_id" : "10009", "value" : 312 }
{ "_id" : "10010", "value" : 243 }
{ "_id" : "10011", "value" : 467 }
{ "_id" : "10012", "value" : 407 }
{ "_id" : "10013", "value" : 480 }
{ "_id" : "10014", "value" : 428 }
{ "_id" : "10016", "value" : 433 }
{ "_id" : "10017", "value" : 377 }
{ "_id" : "10018", "value" : 345 }
{ "_id" : "10019", "value" : 675 }
{ "_id" : "10020", "value" : 46 }
{ "_id" : "10021", "value" : 155 }
{ "_id" : "10022", "value" : 485 }
{ "_id" : "10023", "value" : 195 }
{ "_id" : "10024", "value" : 200 }
{ "_id" : "10025", "value" : 235 }
{ "_id" : "10026", "value" : 75 }
{ "_id" : "10027", "value" : 162 }
{ "_id" : "10028", "value" : 215 }
{ "_id" : "10029", "value" : 202 }
{ "_id" : "10030", "value" : 41 }
{ "_id" : "10031", "value" : 100 }
{ "_id" : "10032", "value" : 117 }
{ "_id" : "10033", "value" : 117 }
{ "_id" : "10034", "value" : 111 }
{ "_id" : "10035", "value" : 87 }
{ "_id" : "10036", "value" : 611 }
{ "_id" : "10037", "value" : 33 }
{ "_id" : "10038", "value" : 164 }
{ "_id" : "10039", "value" : 31 }

*/

/* 2.- Grades por restaurant */

var mapGrades = function(){
    emit(this.name, this.grades.length);
}

var countGrades = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(mapGrades, countGrades, {out:"countGrades"}).find();

/* Return

{ "_id" : "", "value" : 0 }
{ "_id" : "#1 Garden Chinese", "value" : 5 }
{ "_id" : "#1 Me. Nick'S", "value" : 1 }
{ "_id" : "#1 Sabor Latino Restaurant", "value" : 5 }
{ "_id" : "$1.25 Pizza", "value" : 4 }
{ "_id" : "''U'' Like Chinese Restaurant", "value" : 5 }
{ "_id" : "''W'' Cafe", "value" : 1 }
{ "_id" : "'Wichcraft", "value" : 7 }
{ "_id" : "(Lewis Drug Store) Locanda Vini E Olii", "value" : 5 }
{ "_id" : "(Library)  Four & Twenty Blackbirds", "value" : 2 }
{ "_id" : "(Public Fare) 81St Street And Central Park West (Delacorte Theatre)", "value" : 4 }
{ "_id" : "/ L'Ecole", "value" : 4 }
{ "_id" : "002 Mercury Tacos Llc", "value" : 0 }
{ "_id" : "1 2 3 Burger Shot Beer", "value" : 4 }
{ "_id" : "1 Banana Queen", "value" : 6 }
{ "_id" : "1 Buen Sabor", "value" : 5 }
{ "_id" : "1 Darbar", "value" : 5 }
{ "_id" : "1 East 66Th Street Kitchen", "value" : 4 }
{ "_id" : "1 Oak", "value" : 3 }
{ "_id" : "1 Or 8", "value" : 6 }

*/

/* 3.- Total de scores por restaurant */

var mapScores = function(){
    this.grades.forEach((value) => {
        emit(this.name, value.score)
    });
}

var countScores = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(mapScores, countScores, {out:"countScores"}).find();

/* Return

{ "_id" : "#1 Garden Chinese", "value" : 54 }
{ "_id" : "#1 Me. Nick'S", "value" : 10 }
{ "_id" : "#1 Sabor Latino Restaurant", "value" : 136 }
{ "_id" : "$1.25 Pizza", "value" : 31 }
{ "_id" : "''U'' Like Chinese Restaurant", "value" : 64 }
{ "_id" : "''W'' Cafe", "value" : 43 }
{ "_id" : "'Wichcraft", "value" : 65 }
{ "_id" : "(Lewis Drug Store) Locanda Vini E Olii", "value" : 33 }
{ "_id" : "(Library)  Four & Twenty Blackbirds", "value" : 18 }
{ "_id" : "(Public Fare) 81St Street And Central Park West (Delacorte Theatre)", "value" : 56 }
{ "_id" : "/ L'Ecole", "value" : 41 }
{ "_id" : "1 2 3 Burger Shot Beer", "value" : 42 }
{ "_id" : "1 Banana Queen", "value" : 61 }
{ "_id" : "1 Buen Sabor", "value" : 65 }
{ "_id" : "1 Darbar", "value" : 43 }
{ "_id" : "1 East 66Th Street Kitchen", "value" : 13 }
{ "_id" : "1 Oak", "value" : 29 }
{ "_id" : "1 Or 8", "value" : 68 }
{ "_id" : "1 Stop Patty Shop", "value" : 45 }
{ "_id" : "10 Devoe", "value" : 13 }

*/

/* 4.- cuantos restaurantes obtuvieron grade A, B o C */

var mapCountPerGrades = function(){
    this.grades.forEach((value) => {
        emit(value.grade, 1)
    });
}

var countCountPerGrades = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(mapCountPerGrades, countCountPerGrades, {out:"perGrades"}).find();

/* Return 

{ "_id" : "A", "value" : 74656 }
{ "_id" : "B", "value" : 12603 }
{ "_id" : "C", "value" : 3145 }
{ "_id" : "Not Yet Graded", "value" : 525 }
{ "_id" : "P", "value" : 1197 }
{ "_id" : "Z", "value" : 1337 }

*/

/* 5.- cuantos restaurantes por cuisine */

var mapCountPerCuisine = function(){
    emit(this.cuisine, 1)
}

var countCountPerCuisine = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(mapCountPerCuisine, countCountPerCuisine, {out:"perCuisine"}).find();

/* Return

{ "_id" : "Afghan", "value" : 14 }
{ "_id" : "African", "value" : 68 }
{ "_id" : "American", "value" : 6183 }
{ "_id" : "Armenian", "value" : 40 }
{ "_id" : "Asian", "value" : 309 }
{ "_id" : "Australian", "value" : 16 }
{ "_id" : "Bagels/Pretzels", "value" : 168 }
{ "_id" : "Bakery", "value" : 691 }
{ "_id" : "Bangladeshi", "value" : 36 }
{ "_id" : "Barbecue", "value" : 52 }
{ "_id" : "Bottled beverages, including water, sodas, juices, etc.", "value" : 72 }
{ "_id" : "Brazilian", "value" : 26 }
{ "_id" : "CafÃ©/Coffee/Tea", "value" : 2 }
{ "_id" : "Café/Coffee/Tea", "value" : 1214 }
{ "_id" : "Cajun", "value" : 7 }
{ "_id" : "Californian", "value" : 1 }
{ "_id" : "Caribbean", "value" : 657 }
{ "_id" : "Chicken", "value" : 410 }
{ "_id" : "Chilean", "value" : 1 }
{ "_id" : "Chinese", "value" : 2418 }

*/

/* 6.- 10 restaurantes más cercanos a restaurant_id: 40360045 */

var mapCloser = function(){
    var lat = -73.9653967;
    var long = 40.6064339;
    
    this.address.coord
}

var countCloser = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(mapCloser, countCloser, {out:"closer"}).find();