MATCH path = (w:Wheel)-[:DEPENDS_ON]->(a:Axle)
RETURN path
