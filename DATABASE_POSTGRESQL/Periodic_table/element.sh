#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $# -ne 1 ]]
then
	echo "Please provide an element as an argument."
else
	ANSWER=$1

	if [[ $ANSWER =~ ^[0-9]+$ ]]
	then
		ATOMIC_NUMBER_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '$ANSWER'")
		SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$ANSWER'")
		NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$ANSWER'")
	else
		ATOMIC_NUMBER_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$ANSWER'")
		SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$ANSWER'")
		NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$ANSWER'")

		if [[ -z $ATOMIC_NUMBER_ID ]]
		then
			ATOMIC_NUMBER_ID=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$ANSWER'")
			SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$ANSWER'")
			NAME=$($PSQL "SELECT name FROM elements WHERE name = '$ANSWER'")
		fi
	fi

	if [[ -z $ATOMIC_NUMBER_ID ]]
	then
		echo "I could not find that element in the database."
	else
		TYPE=$($PSQL "SELECT type FROM types FULL JOIN properties USING (type_id) WHERE atomic_number = '$ATOMIC_NUMBER_ID'")
		ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$ATOMIC_NUMBER_ID'")
		MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$ATOMIC_NUMBER_ID'")
		BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$ATOMIC_NUMBER_ID'")

		echo "The element with atomic number $ATOMIC_NUMBER_ID is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius." 
	fi
fi
