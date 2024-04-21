docker build -qt volumes .
docker run -d --name volumes-container1 volumes
docker run -d --name volumes-container2 volumes

$container1_volume = (docker exec volumes-container1 ls /apps/volumes)
$container2_volume = (docker exec volumes-container2 ls /apps/volumes)

docker exec volumes-container1 touch /apps/volumes/volume2

$container1_change_volume = (docker exec volumes-container1 ls /apps/volumes)
$container2_change_volume = (docker exec volumes-container2 ls /apps/volumes)

docker stop volumes-container1
docker stop volumes-container2

docker rm -v volumes-container1
docker rm -v volumes-container2

docker rmi volumes

clear

if($container1_change_volume -ceq $container2_change_volume){
    write-host "----------------------------------------------------------"
    write-host "VOLUMES BEFORE ADDING volume2 to container1"
    write-host "container1 /apps/volumes: $container1_volume"
    write-host "container2 /apps/volumes: $container2_volume"

    write-host "----------------------------------------------------------"
    write-host "VOLUMES AFTER ADDING volume2 to container1"
    write-host "container1 /apps/volumes: $container1_change_volume"
    write-host "container2 /apps/volumes: $container1_change_volume"

}else{
    write-host "Error test"
}