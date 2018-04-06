// 1.- ¿Cuál es el total de alumnos inscritos?
db.grades.aggregate([{
    $group: {_id: null, students: {$sum: 1}}
}])

// Respuesta: { "_id" : null, "value" : 280 }

// 2.- ¿Cuántos cursos se han impartido?
db.grades.aggregate([
    {
        $group: { _id: null, courses: { $addToSet: '$class_id'} }
    },
    {
        $unwind:"$courses"
    },
    {
        $group: { _id: "$_id", coursesCount: { $sum:1} }
    }
])

// Respuesta { "_id" : null, "coursesCount" : 31 }

// 3.- Encuentra, para cada alumno, su promedio obtenido en cada una de las clases en las que fue inscrito (promedia exámenes, quizes, tareas y todas las actividades realizadas que contenga un grade)
var mapScores = function(){
    this.scores.forEach((value) => {
        emit(this.student_id, value.score)            
    });
}

var reduceScores = function(name, values){
    return Array.sum(values) / values.length;
}

db.grades.mapReduce(mapScores, reduceScores, {out:"countScores"}).find();

// 4.- ¿Cuál fue la materia que tiene la calificación más baja (muestra el id de la materia, el id del alumno y la calificación)?
db.grades.aggregate([
    {
        $unwind:"$scores"
    },
    {
        $group: { _id: null, class_id: { "$first": "$class_id" }, student_id: { "$first": "$student_id" }, calificacion: { $min: "$scores.score" } }
    },
]);

// {"_id": null, "class_id": 11, "student_id": 12, "calificacion" : 0.04794785051871475}

// 5.- ¿Cuál es la materia en la que tiene más tareas calificadas?
var mapScores = function(){
    this.scores.forEach((value) => {
        if(value.type == "homework"){
            emit(this.class_id, 1)
        }
    });
}

var reduceScores = function(name, values){
    return Array.sum(values);
}

db.grades.mapReduce(mapScores, reduceScores, {out:"countScores"}).find().sort({value: -1}).limit(1);

// { "_id" : 22, "value" : 43 }

// 6.- ¿Qué alumno se inscribió en más cursos?

db.grades.aggregate([
    {
        $group: { _id: "$student_id", courses: { $addToSet: '$class_id'} }
    },
    {
        $unwind:"$courses"
    },
    {
        $group: { _id: "$_id", coursesCount: { $sum:1} }
    },
    {
        $sort: { coursesCount: -1 }
    }, {$limit: 1}
])

// { "_id" : 0, "coursesCount" : 11 }

// 7.- ¿Cuál fue el curso que tuvo más reprobados?
var mapScores = function(){
    this.scores.forEach((value) => {
        if(value.type == "exam" && value.score < 70){
            emit(this.class_id, 1)
        }
    });
}

var reduceScores = function(name, values){
    return Array.sum(values);
}

db.grades.mapReduce(mapScores, reduceScores, {out:"countScores"}).find().sort({value: -1}).limit(1);

// { "_id" : 22, "value" : 11 }