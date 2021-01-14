source "$PR_SIZE_LABELER_HOME/src/rocket.sh"

main(){

   rocket::sendGroupMessage $1 $2
   rocket::sendPrivateMessage $3 $4 $5 $2

   exit $?
}
