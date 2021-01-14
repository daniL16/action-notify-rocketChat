#!/usr/bin/env bash

URL_LOGIN="/api/v1/login"
SEND_MESSAGE_URL="/api/v1/chat.postMessage"

rocket::sendGroupMessage(){
	msg="$2"
  ROCKET_CHAT_HOOK="$1"
	data="{\"text\":\"${msg}\",\"username\": \"${BOT_NAME}\",\"avatar\":\"${BOT_AVATAR}\"}"
	curl -H "Content-type:application/json" "${ROCKET_CHAT_URL}/hooks/{$ROCKET_CHAT_HOOK}" -d "$data"
}


rocket::sendPrivateMessage(){
  msg="$4"
  TO="@$3"

  loginData="{\"user\":\"$1\",\"password\":\"$2\"}"
  data="{\"channel\":\"${TO}\",\"text\":\"${msg}\",\"username\": \"${BOT_NAME}\",\"avatar\":\"${BOT_AVATAR}\"}"
  login=$(curl -s -H "Content-type:application/json" "${ROCKET_CHAT_URL}{$URL_LOGIN}" -d "$loginData")
  userData=$(echo "$login" | jq '.data')
  userId=$(echo "$userData" | jq -r '.userId')
  token=$(echo "$userData" | jq -r '.authToken')

  response=$(curl -s -H "Content-type:application/json" --header "X-User-Id: "$userId --header "X-Auth-Token: "$token "${ROCKET_CHAT_URL}{$SEND_MESSAGE_URL}" -d "$data")
  echo {$response}
}
