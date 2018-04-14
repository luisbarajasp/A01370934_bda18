// 1.- ¿Cuántos actores hay?

MATCH (n:Person)-[a:ACTED_IN]->() RETURN count(DISTINCT n)
// 102

// 2.- ¿cuántos productores hay?

MATCH (n:Person)-[a:PRODUCED]->() RETURN count(DISTINCT n)
// 8

// 3.- ¿cuántos directores hay?

MATCH (n:Person)-[a:DIRECTED]->() RETURN count(DISTINCT n)
// 28

// 4.- ¿cuántas películas hay?

MATCH (m: Movie) RETURN count(m)
// 38

// 5.- ¿Quién ha escrito más películas?

MATCH (a)-[:WROTE]->(m) RETURN a, COLLECT(m) as movies ORDER BY SIZE(movies) DESC LIMIT 1
// Andy Wachowski, 2 movies

// 6.- El top 5 de películas con el mejor Rating

MATCH (m:Movie)-[r:REVIEWED]-() WHERE EXISTS(r.rating) RETURN m, avg(r.rating) AS rating ORDER BY rating DESC LIMIT 5
// ╒══════════════════════════════╤═════════════════╕
// │m                             │rating           │
// ╞══════════════════════════════╪═════════════════╡
// │{tagline: Everything is connec│95               │
// │ted, title: Cloud Atlas, relea│                 │
// │sed: 2012}                    │                 │
// ├──────────────────────────────┼─────────────────┤
// │{tagline: The rest of his life│92               │
// │ begins now., title: Jerry Mag│                 │
// │uire, released: 2000}         │                 │
// ├──────────────────────────────┼─────────────────┤
// │{tagline: It's a hell of a thi│85               │
// │ng, killing a man, title: Unfo│                 │
// │rgiven, released: 1992}       │                 │
// ├──────────────────────────────┼─────────────────┤
// │{tagline: Pain heals, Chicks d│75.66666666666667│
// │ig scars... Glory lasts foreve│                 │
// │r, title: The Replacements, re│                 │
// │leased: 2000}                 │                 │
// ├──────────────────────────────┼─────────────────┤
// │{tagline: Break The Codes, tit│66.5             │
// │le: The Da Vinci Code, release│                 │
// │d: 2006}                      │                 │
// └──────────────────────────────┴─────────────────┘

// 7.- ¿Qué personas debería conocer Al Pacino para que le presentaran a Audrey Tautou?

match p = shortestPath((pacino:Person{name:"Al Pacino"})-[r*]-(audrey:Person{name:"Audrey Tautou"})) where NONE( rel in r WHERE type(rel)="REVIEWED" OR type(rel)="FOLLOWS") return p
// ╒══════════════════════════════╕
// │p                             │
// ╞══════════════════════════════╡
// │[{born: 1940, name: Al Pacino}│
// │, {roles: [John Milton]}, {tag│
// │line: Evil has its winning way│
// │s, title: The Devil's Advocate│
// │, released: 1997}, {roles: [Ma│
// │ry Ann Lomax]}, {born: 1975, n│
// │ame: Charlize Theron}, {roles:│
// │ [Tina]}, {tagline: In every l│
// │ife there comes a time when th│
// │at thing you dream becomes tha│
// │t thing you do, title: That Th│
// │ing You Do, released: 1996}, {│
// │}, {born: 1956, name: Tom Hank│
// │s}, {roles: [Dr. Robert Langdo│
// │n]}, {tagline: Break The Codes│
// │, title: The Da Vinci Code, re│
// │leased: 2006}, {roles: [Sophie│
// │ Neveu]}, {born: 1976, name: A│
// │udrey Tautou}]                │
// └──────────────────────────────┘

// 8.- ¿Qué actores que han producido y actuado en la misma película?

MATCH (n)-[:ACTED_IN]->(m)<-[:PRODUCED]-(n) RETURN n
// no rows