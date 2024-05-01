docker build -qt env-image .
docker run --name env-container -d env-image

$content = (docker exec env-container env)

docker stop env-container
docker rm env-container
docker rmi env-image

clear

$expected_result = ("MY_NAME=Tom Palen", "MY_IMAGE=timirald", "COMPUTER=MAINWS-2256")
$actual_result = $content.where({$_ -in $expected_result})

$expected_result = $expected_result -join "`n"
$actual_result = $actual_result -join "`n"

if($actual_result -eq $expected_result){
    write-host "-------------------------------------------"
    write-host "SUCCESS TEST"
    write-host $actual_result
}else{
    write-host "ERROR TEST"
}