docker build -qt stopsignal .
docker run -d --name stopsignal-container stopsignal
docker stop stopsignal-container

$exit_code = (docker inspect --format="{{.State.ExitCode}}" stopsignal-container)

docker rm stopsignal-container
docker rmi stopsignal

Clear-Host

if($exit_code -eq 137){
    Write-Host "---------------------------------------------"
    Write-Host "SUCCESS TEST"
    write-host "Exit code cotainer: SIGKILL == $exit_code"
}else{
    write-host "ERROR TEST"
}