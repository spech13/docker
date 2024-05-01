docker build -qt test-image .

$author_name = (docker inspect --format="{{json .Author}}" test-image) | convertfrom-json

docker rmi test-image

clear

if($author_name -eq "author-name"){
    write-host "-----------------------------------------"
    write-host "SUCCESS"
    write-host "Author name: $author_name"
}else{
    write-host "ERROR TEST"
}
