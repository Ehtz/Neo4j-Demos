MATCH path = (bogie:Bogie)-[:HAS_SUBPART*]->(part:Part)
             -[:MADE_BY]->(factory:Factory {status: 'closed'})
RETURN path
