docker build -qt user-image .
docker run --name user-container -d user-image

$user = (docker exec user-container whoami)

docker stop user-container
docker rm user-container
docker rmi user-image

Clear-Host

if($user -eq "myuser"){
    Write-Host "---------------------------------------"
    Write-Host "SUCCESS TEST"
    Write-Host "User: $user"
}else{
    Write-Host "ERROR TEST"
}