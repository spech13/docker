docker build -qt stopsignal .

docker run -d --name stopsignal-container stopsignal

docker stop stopsignal-container

$exit_code = (docker inspect --format="{{.State.ExitCode}}" stopsignal-container)

docker rm stopsignal-container

docker rmi stopsignal

clear

if($exit_code -eq 137){
    write-host "Exit code cotainer: SIGKILL == $exit_code"
}else{
    write-host "Error test"
}