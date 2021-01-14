source "$PR_SIZE_LABELER_HOME/src/rocket.sh"

main(){

   rocket::sendNotification $1 $2

   exit $?
}
