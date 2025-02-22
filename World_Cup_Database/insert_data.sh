#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# RESET TABLES
psql --username=freecodecamp --dbname=worldcup -t --no-align -f worldcup.sql

# CREATE TEMP TABLE FOR IMPORT PURPOSES
$PSQL "CREATE TABLE temp_table (
    year INT, 
    round VARCHAR(30), 
    winner VARCHAR(30), 
    opponent VARCHAR(30), 
    winner_goals INT, 
    opponent_goals INT);"

$PSQL "\copy temp_table 
    FROM '/workspace/project/games.csv' 
    WITH (FORMAT csv, HEADER true)"

# TEAMS
$PSQL "INSERT INTO teams (name) 
    SELECT DISTINCT winner 
    FROM temp_table;"

$PSQL "INSERT INTO teams (name) 
    SELECT DISTINCT opponent 
    FROM temp_table 
    WHERE opponent 
    NOT IN (SELECT DISTINCT winner FROM temp_table);"

# GAMES
$PSQL "INSERT INTO games (year, round, winner_goals, opponent_goals, winner_id, opponent_id) 
    SELECT year, round, winner_goals, opponent_goals, 
    (SELECT team_id FROM teams t WHERE j.winner = t.name), 
    (SELECT team_id FROM teams t WHERE j.opponent = t.name) 
    FROM temp_table j;"

# DROP temp_table
$PSQL "DROP TABLE temp_table;"

