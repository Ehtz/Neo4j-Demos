//La chaîne de pièces partant de la bogie affectée par une usine fermée
MATCH path = (bogie:Bogie)-[:HAS_SUBPART*]->(part:Part)
             -[:MADE_BY]->(factory:Factory {status: 'closed'})
RETURN path
