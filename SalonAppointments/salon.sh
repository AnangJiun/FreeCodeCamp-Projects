#!/bin/bash 

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align  -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

echo "$(psql --username=freecodecamp --dbname=salon -t -F ") " --no-align  -c "SELECT * FROM services;")"

read SERVICE_ID_SELECTED

SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = ${SERVICE_ID_SELECTED}")

if [[ $SERVICE_ID_SELECTED > 5  ||  $SERVICE_ID_SELECTED < 1 ]];
then
  echo "$(psql --username=freecodecamp --dbname=salon -t -F ") " --no-align  -c "SELECT * FROM services;")"
else
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  $PSQL "SELECT * FROM customers;"

  if [[ $($PSQL "SELECT COUNT(*) FROM customers WHERE phone = '${CUSTOMER_PHONE}';") -gt 0 ]];
  then
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '${CUSTOMER_PHONE}'";)
    echo -e "\nWhat time would you like your ${SERVICE_NAME}, ${CUSTOMER_NAME}?"
    read SERVICE_TIME

    $PSQL "INSERT INTO appointments(customer_id, service_id, time)
    SELECT customer_id , '${SERVICE_ID_SELECTED}', '${SERVICE_TIME}' FROM customers WHERE name = '${CUSTOMER_NAME}'"

    echo -e "\nI have put you down for a ${SERVICE_NAME} at ${SERVICE_TIME}, ${CUSTOMER_NAME}."
  else
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    $PSQL "INSERT INTO customers(name, phone) VALUES ('${CUSTOMER_NAME}', '${CUSTOMER_PHONE}')"
    
    echo -e "\nWhat time would you like your , ${CUSTOMER_NAME}?"
    read SERVICE_TIME

    $PSQL "INSERT INTO appointments(customer_id, service_id, time)
    SELECT customer_id , '${SERVICE_ID_SELECTED}', '${SERVICE_TIME}' FROM customers WHERE name = '${CUSTOMER_NAME}'"

    echo -e "\nI have put you down for a ${SERVICE_NAME} at ${SERVICE_TIME}, ${CUSTOMER_NAME}."
  fi
fi