source "$PR_SIZE_LABELER_HOME/src/rocket.sh"

# $1 -> Chat Url
# $2 -> Message
# $3 -> Group hook (opt)
# $4,$5,$6 -> Private message params

main(){

export ROCKET_CHAT_URL="$1"
export BOT_NAME="$7"
export BOT_AVATAR="$8"

if [[ -n "$5" ]]; then
  rocket::sendPrivateMessage $4 $5 $6 $2
else
  rocket::sendGroupMessage $3 $2
fi
   exit $?
}
