docker build -f Base-Dockerfile . -qt base-onbuild-image
docker run --name base-onbuild-container -d base-onbuild-image

$base_content = (docker exec base-onbuild-container ls /test)
$base_content = "$base_content '$(docker exec base-onbuild-container cat /test/base-onbuild)'"

docker stop base-onbuild-container
docker rm base-onbuild-container

docker build -qt onbuild-image .
docker run --name onbuild-container -d onbuild-image

$content = (docker exec onbuild-container ls /test)
$content[0] = "$($content[0]) '$(docker exec onbuild-container cat /test/base-onbuild)'"
$content[1] = "$($content[1]) '$(docker exec onbuild-container cat /test/from-onbuild)'"
$content[2] = "$($content[2]) '$(docker exec onbuild-container cat /test/onbuild)'"
$content = $content -join "`n"

docker stop onbuild-container
docker rm onbuild-container
docker rmi onbuild-image

docker rmi base-onbuild-image

Clear-Host

$expected_base_content = "base-onbuild 'BASE ONBUILD IMAGE FILE'"

$expected_content = (
    "base-onbuild 'BASE ONBUILD IMAGE FILE'",
    "from-onbuild 'FILE FROM BASE ONBUILD IMAGE'",
    "onbuild 'ONBUILD IMAGE FILE'"
) -join "`n"

if($base_content -eq $expected_base_content -and $expected_content -eq $content){
    Write-Host "---------------------------------"
    Write-Host "SUCCESS TEST"
    Write-Host "Base onbuild container content:"
    Write-Host $base_content
    Write-Host "Onbuild container content:"
    Write-Host $content
}else {
    Write-Host "ERROR TEST"
}