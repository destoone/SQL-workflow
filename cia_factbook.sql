%%capture
%load_ext sql
%sql sqlite:///factbook.db

%%sql
SELECT *
  FROM sqlite_master
 WHERE type='table';

%%sql
SELECT *
FROM facts 
LIMIT 5

%%sql
SELECT 
MIN(population),
MAX(population),
MIN(population_growth),
MAX(population_growth),
MIN(birth_rate),
MAX(birth_rate),
MIN(death_rate),
MAX(death_rate),
MIN(migration_rate),
MAX(migration_rate)
FROM facts;

%%sql
SELECT name
    FROM facts
 WHERE population == (SELECT MIN(population)
                        FROM facts
                     );

%%sql
SELECT name
    FROM facts
 WHERE population == (SELECT MAX(population)
                        FROM facts
                     );

%%sql
SELECT 
MIN(population),
MAX(population),
MIN(population_growth),
MAX(population_growth),
MIN(birth_rate),
MAX(birth_rate),
MIN(death_rate),
MAX(death_rate),
MIN(migration_rate),
MAX(migration_rate)
FROM facts
WHERE name!="World";

%%sql
SELECT 
MIN(population),
MAX(population),
MIN(population_growth),
MAX(population_growth),
MIN(birth_rate),
MAX(birth_rate),
MIN(death_rate),
MAX(death_rate),
MIN(migration_rate),
MAX(migration_rate)
FROM facts
WHERE name!="Antarctica";

%%sql
SELECT 
AVG(population),
AVG(area)
FROM facts
WHERE name!="World";

%%sql
SELECT 
name
FROM facts
WHERE population>(SELECT AVG(population) FROM facts) AND
    area<(SELECT AVG(area) FROM facts);

