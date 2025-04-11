MATCH path = (p:Part)-[:MADE_BY]->(f:Factory)
WHERE p.installedOn < date("2022-01-01")
RETURN path
