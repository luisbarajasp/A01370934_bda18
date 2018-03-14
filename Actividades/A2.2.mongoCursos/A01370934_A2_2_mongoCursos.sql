use cursos
db.createCollection("cursos")

db.cursos.insert({titulo:"Bases de datos", profesor:{nombre:"Ariel Lucien", nomina:"L1234", direccion:"Santa Fe", genero:"Masculino", cursos:[{titulo: "Bases de datos", ano:2018}]}, ano:2018})

db.cursos.update({titulo: "Bases de datos"}, {$set: {alumnos:[{nombre:"Luis Barajas", matricula:"A01370934", direccion:"Coyoacan", genero:"Masculino", cursos:[{titulo:"Bases de datos", ano:2018}]}]} })

db.cursos.update({titulo: "Bases de datos"}, {$set: {evaluacionesEscritas:[{numero:1, preguntasTeoricas: 4, preguntasPracticas:10}]} })
db.cursos.update({titulo: "Bases de datos"}, {$push: {evaluacionesEscritas:{numero:2, preguntasTeoricas: 5, preguntasPracticas:9}} })
db.cursos.update({titulo: "Bases de datos"}, {$push: {evaluacionesEscritas:{numero:3, preguntasTeoricas: 2, preguntasPracticas:12}} })
db.cursos.update({titulo: "Bases de datos"}, {$push: {evaluacionesEscritas:{numero:4, preguntasTeoricas: 0, preguntasPracticas:14}} })

db.cursos.update({titulo: "Bases de datos"}, {$set: {"alumnos.0.evaluaciones":[{numero:1, calificacion:100}]} })
db.cursos.update({titulo: "Bases de datos"}, {$push: {"alumnos.0.evaluaciones":{numero:2, calificacion:90}} })
db.cursos.update({titulo: "Bases de datos"}, {$push: {"alumnos.0.evaluaciones":{numero:3, calificacion:95}} })
db.cursos.update({titulo: "Bases de datos"}, {$push: {"alumnos.0.evaluaciones":{numero:4, calificacion:85}} })

db.cursos.update({titulo: "Bases de datos"}, {$set: {"alumnos.0.calificacionFinal":92.5} })

db.cursos.update({titulo: "Bases de datos"}, {$set: {"evaluacionesAlumnos":[{matricula:"A01370934", calificacion:100}]} })

db.cursos.update({titulo: "Bases de datos"}, {$set: {"evaluacionesProfesores":[{matricula:"A01370934", calificacion:100}]} })

db.cursos.update({titulo: "Bases de datos"}, {$set: {"comentariosAlumnos":[{matricula:"A01370934", comentarios:["Pinta bien la clase"]}]} })
db.cursos.update({titulo: "Bases de datos"}, {$push: {"comentariosAlumnos.0.comentarios":"Sí estuvo como lo esperaba"} })

{
	"_id" : ObjectId("5aa99012408b39d6d08cb26d"),
	"titulo" : "Bases de datos",
	"profesor" : {
		"nombre" : "Ariel Lucien",
		"nomina" : "L1234",
		"direccion" : "Santa Fe",
		"genero" : "Masculino",
		"cursos" : [
			{
				"titulo" : "Bases de datos",
				"ano" : 2018
			}
		]
	},
	"ano" : 2018,
	"alumnos" : [
		{
			"nombre" : "Luis Barajas",
			"matricula" : "A01370934",
			"direccion" : "Coyoacan",
			"genero" : "Masculino",
			"cursos" : [
				{
					"titulo" : "Bases de datos",
					"ano" : 2018
				}
			],
			"evaluaciones" : [
				{
					"numero" : 1,
					"calificacion" : 100
				},
				{
					"numero" : 2,
					"calificacion" : 90
				},
				{
					"numero" : 3,
					"calificacion" : 95
				},
				{
					"numero" : 4,
					"calificacion" : 85
				}
			],
			"calificacionFinal" : 92.5
		}
	],
	"evaluacionesEscritas" : [
		{
			"numero" : 1,
			"preguntasTeoricas" : 4,
			"preguntasPracticas" : 10
		},
		{
			"numero" : 2,
			"preguntasTeoricas" : 5,
			"preguntasPracticas" : 9
		},
		{
			"numero" : 3,
			"preguntasTeoricas" : 2,
			"preguntasPracticas" : 12
		},
		{
			"numero" : 4,
			"preguntasTeoricas" : 0,
			"preguntasPracticas" : 14
		}
	],
	"evaluacionesAlumnos" : [
		{
			"matricula" : "A01370934",
			"calificacion" : 100
		}
	],
	"evaluacionesProfesores" : [
		{
			"matricula" : "A01370934",
			"calificacion" : 100
		}
	],
	"comentariosAlumnos" : [
		{
			"matricula" : "A01370934",
			"comentarios" : [
				"Pinta bien la clase",
				"Sí estuvo como lo esperaba"
			]
		}
	]
}
