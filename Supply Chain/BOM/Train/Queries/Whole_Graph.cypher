// Graph du BOM total de la bogie de train
MATCH (n) OPTIONAL MATCH p=(n)--() RETURN p, n LIMIT 100
