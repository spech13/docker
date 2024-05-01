docker build -qt workdir-image .
docker run --name workdir-container -d workdir-image

$content = (docker exec workdir-container ls)

docker stop workdir-container
docker rm workdir-container
docker rmi workdir-image

clear-host

if($content -eq "myuserfile"){
    write-host "--------------------------------------------"
    write-host "SUCCESS TEST"
    write-host "home/myuser: $content"
}else{
    write-host "ERROR TEST"
}