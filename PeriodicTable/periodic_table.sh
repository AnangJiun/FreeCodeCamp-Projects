#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -c"

#Let's fix!!!

#$PSQL "ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;"
#$PSQL "ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;"
#$PSQL "ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;"
#$PSQL "ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL, ALTER COLUMN melting_point_celsius SET NOT NULL;"
#$PSQL "ALTER TABLE elements ADD UNIQUE (symbol), ADD UNIQUE (name);"
#$PSQL "ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL, ALTER COLUMN name SET NOT NULL;"
#$PSQL "ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);"

#$PSQL "CREATE TABLE types (type_id INT PRIMARY KEY, type VARCHAR(50) NOT NULL);"

#$PSQL "INSERT INTO types (type_id,type) VALUES (1, 'nonmetal'), (2, 'metal'),(3, 'metalloid');"

#$PSQL "ALTER TABLE properties ADD COLUMN type_id INT;"

#$PSQL "UPDATE properties p SET type_id = (SELECT t.type_id FROM types t WHERE p.type = t.type);"

#$PSQL "ALTER TABLE properties ADD FOREIGN KEY (type_id) REFERENCES types(type_id);"
#$PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL"

#$PSQL "UPDATE elements SET symbol = INITCAP(symbol);"

#$PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL"
#$PSQL "UPDATE properties SET atomic_mass = TRIM(TRAILING '0' FROM CAST(atomic_mass as TEXT))::DECIMAL;"

#$PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');"

#$PSQL "INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type, type_id) VALUES (9, 18.998, -220, -188.1, 'nonmetal', 1), (10, 20.18, -248.6, -246.1, 'nonmetal', 1);"

#$PSQL "UPDATE properties SET melting_point_celsius = -248.6 WHERE atomic_number = 10;"

#$PSQL "DELETE FROM properties WHERE atomic_number = 1000;"
#$PSQL "DELETE FROM elements WHERE atomic_number = 1000;"

#$PSQL "ALTER TABLE properties DROP COLUMN type;"

#$PSQL "SELECT * FROM properties;"
#$PSQL "SELECT * FROM elements;"