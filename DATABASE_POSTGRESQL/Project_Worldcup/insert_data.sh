#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	if [[ $WINNER != winner ]]
	then
			WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
			OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

		if [[ -z $WINNER_ID || -z $OPPONENT_ID ]]
		then
			INSERT_TEAM_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
			INSERT_TEAM_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
			
			if [[ $INSERT_TEAM_WINNER_RESULT == "INSERT 0 1" || $INSERT_TEAM_OPPONENT_RESULT == "INSERT 0 1" ]]
			then
				echo "Inserted into teams, $WINNER, $OPPONENT"
			fi

			WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
			OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
		fi
		
		GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id = $WINNER_ID AND opponent_id = $OPPONENT_ID")

		if [[ -z $GAME_ID ]]
		then

			INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
			
			if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
			then
				echo "Inserted into games, $YEAR, $ROUND"
			fi
		fi
	fi
done
