docker build -t cmd-image .
docker run --name cmd-container -dp 8080:8080 cmd-image

sleep 2
$response = invoke-webrequest http://localhost:8080

docker stop cmd-container
docker rm cmd-container
docker rmi cmd-image

clear

if($response.statuscode -eq 200){
    write-host "-----------------------------------------------"
    write-host "SUCCES TEST"
    write-host ("status code: " + $response.statuscode)
}else{
    write-host "ERROR TEST"
}