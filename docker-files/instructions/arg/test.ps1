docker build --build-arg required_username=myuser -qt arg-image .
docker run -d --name arg-container arg-image

$actual_result = (docker exec arg-container ls /home)

docker stop arg-container
docker rm arg-container
docker rmi arg-image

clear

if($actual_result[0] -eq "myuser" -and $actual_result[1] -eq "myuser2"){
    write-host "------------------------------------------------"
    write-host "SUCCESS TEST"
    write-host $actual_result
}else{
    write-host "ERROR TEST"
}