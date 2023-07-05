#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo $($PSQL "TRUNCATE customers, appointments")

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
	
	SERVICE_SALON=$($PSQL "SELECT service_id, name FROM services WHERE service_id IS NOT NULL")
	
	if [[ -z $SERVICE_SALON ]]
	then
		
		echo "I could not find that service. What would you like today?"

	else
		echo -e "\nWelcome to My Salon, how can I help you"
	
		echo "$SERVICE_SALON" | while read SERVICE_ID BAR NAME
		do
			echo "$SERVICE_ID) $NAME"

		done
		
		read SERVICE_ID_SELECTED

		if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
		then
			#send to main menu
			MAIN_MENU "That is not a valid service number"

		else
			#get service availability
			SERVICE_ID_TO_SALON=$($PSQL "SELECT service_id FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
			
			#if not available or exist
			if [[ -z $SERVICE_ID_TO_SALON ]]
			then
				#send to main menu
				echo "I could not find that service. What would you like today?" 
				MAIN_MENU
				
			else
				#get customer info
				echo -e "\nWhat's your phone number?"
				read CUSTOMER_PHONE

				CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

				#if customer doesn't exist
				if [[ -z $CUSTOMER_NAME ]]
				then
					#get new customer name
					echo -e "I don't have a record for that phone number, what's your name?"
					read CUSTOMER_NAME
					
					echo -e "What time would you like your $NAME, $CUSTOMER_NAME?"
					read SERVICE_TIME

					#insert new customer
					INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
				fi
				
				#get customer_id
				CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

				if [[ -z $SERVICE_TIME ]]
				then
					echo -e "What time would you like your $NAME, $CUSTOMER_NAME?"
					read SERVICE_TIME
				fi

				#insert service salon
				INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
				
				#get service info
				SERVICE_NAME=$($PSQL "SELECT services.name FROM services INNER JOIN appointments USING (service_id) INNER JOIN customers USING (customer_id) WHERE phone = '$CUSTOMER_PHONE'")
				
				#send to main menu
				echo "I have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."

			fi

		fi

	fi

}

MAIN_MENU
