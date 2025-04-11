// Les pièces en dépendance avec l'axe de la roue.
MATCH path = (w:Wheel)-[:DEPENDS_ON]->(a:Axle)
RETURN path
