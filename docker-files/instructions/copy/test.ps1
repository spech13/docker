docker build -qt copy-image .
docker run --name copy-container -d copy-image

$content = (docker exec copy-container ls -la /test)

docker stop copy-container
docker rm copy-container
docker rmi copy-image

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
    "-rwxr-xr-x root file1.txt",
    "-rwxr-xr-x myuser1 file2.txt",
    "-r-------- myuser2 file3.txt"
) -join "`n"

if($expected_result -eq $actual_result){
    write-host "-------------------------------------------------"
    write-host "SUCCESS TESTS"
    write-host $actual_result
}else{
    write-host "ERROR TEST"
}