#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# If no-input
if [ -z "$1" ]; then
  echo "Please provide an element as an argument."

else
  # Checks if element exists in databse
  RESULT=$($PSQL "SELECT COUNT(*) FROM elements WHERE atomic_number::TEXT = '$1' OR symbol = '$1' OR name = '${1}';")

  if [ "$RESULT" -gt 0 ]; then
    # Query for data of the element
    ATOM_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number::TEXT = '$1' OR symbol = '$1' OR name = '${1}';")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$ATOM_NUMBER';")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$ATOM_NUMBER';")
    TYPE=$($PSQL "SELECT t.type FROM types t JOIN properties p ON t.type_id=p.type_id WHERE p.atomic_number = '$ATOM_NUMBER';")
    ATOM_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$ATOM_NUMBER';")
    MELT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$ATOM_NUMBER';")
    BOIL_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$ATOM_NUMBER';")

    # Prints the data of the element
    echo "The element with atomic number $ATOM_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOM_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."

  else
    echo "I could not find that element in the database."
  fi
fi

