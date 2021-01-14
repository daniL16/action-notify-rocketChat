#!/usr/bin/env bash

ROCKET_CHAT_URL="https://chat.bulevip.com"
URL_LOGIN="${ROCKET_CHAT_URL}/api/v1/login"
SEND_MESSAGE_URL="${ROCKET_CHAT_URL}/api/v1/chat.postMessage"

rocket::sendGroupMessage(){
	msg="$2"
  ROCKET_CHAT_HOOK="$1"
	data="{\"text\":\"${msg}\",\"username\": \"Github Bot\"}"
	curl -H "Content-type:application/json" "{$ROCKET_CHAT_URL}/hooks/{$ROCKET_CHAT_HOOK}" -d "$data"
}


rocket::sendPrivateMessage(){
  msg="$4"
  TO="@$3"

  loginData="{\"user\":\"$1\",\"password\":\"$2\"}"
  data="{\"channel\":\"${TO}\",\"text\":\"${msg}\",\"username\": \"Github Bot\",\"avatar\":\"https://i.pinimg.com/originals/bd/5c/46/bd5c46c4c1579c56c60920301ea3e642.png\"}"
  login=$(curl -s -H "Content-type:application/json" "{$URL_LOGIN}" -d "$loginData")
  userData=$(echo "$login" | jq '.data')
  userId=$(echo "$userData" | jq -r '.userId')
  token=$(echo "$userData" | jq -r '.authToken')

  response=$(curl -s -H "Content-type:application/json" --header "X-User-Id: "$userId --header "X-Auth-Token: "$token "{$SEND_MESSAGE_URL}" -d "$data")
  echo {$response}
}
