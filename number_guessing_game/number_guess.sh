#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#echo $($PSQL "TRUNCATE users, userstats")

echo "Enter your username:"

read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_ID ]]
then
	INSERT_USERNAME=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")

	echo "Welcome, $USERNAME! It looks like this is your first time here."
else
	USERNAME=$($PSQL "SELECT username FROM users WHERE user_id = '$USER_ID'")
	GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM userstats WHERE user_id = '$USER_ID'")
	BEST_GAME=$($PSQL "SELECT MIN(best_game) FROM userstats WHERE user_id = '$USER_ID'")

	echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

NUMBER=$(( RANDOM % 999 + 1 ))

while [[ $SECRET_NUMBER != $NUMBER ]]
do
	NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

	read SECRET_NUMBER
	
	if [[ ! $SECRET_NUMBER =~ ^[0-9]+$ ]]
	then
		echo "That is not an integer, guess again:"
		read SECRET_NUMBER
	fi

	if [[ $SECRET_NUMBER -gt $NUMBER ]]
	then
		echo "It's lower than that, guess again:"
	else
		if [[ $SECRET_NUMBER -lt $NUMBER ]]
		then
			echo "It's higher than that, guess again:"
		fi
	fi
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

INSERT_BEST_GAME=$($PSQL "INSERT INTO userstats (user_id, best_game) VALUES ('$USER_ID', '$NUMBER_OF_GUESSES')")
