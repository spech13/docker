docker build -qt add-image .
docker run -d --name add-container add-image

$content = (docker exec -t add-container ls -la test)

docker stop add-container 
docker rm add-container
docker rmi add-image

clear

$content[3] = $content[3].split(" ").where({$_ -ne ""})[0,2,8] -join " " 
$content[4] = $content[4].split(" ").where({$_ -ne ""})[0,2,8] -join " "
$content[5] = $content[5].split(" ").where({$_ -ne ""})[0,2,8] -join " "

$actual_result = (
    $content[3],
    $content[4],
    $content[5]
) -join "`n"

$expected_result = (
    "-rwxr-xr-x root temp.txt",
    "-rwxr-xr-x myuser temp2.txt",
    "-r-------- myuser2 temp3.txt"
) -join "`n"

if($expected_result -eq $actual_result){
    write-host "--------------------------------------------------"
    write-host "SUCCESS TEST"
    write-host $actual_result
}else{
    write-host "ERROR TEST"
}
