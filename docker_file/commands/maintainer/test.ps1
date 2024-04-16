docker build -qt test-image .

$author = docker inspect --format="{{.Author}}" test-image

write-host "----------------------------------------------"
write-host "Image author: $author"
write-host "----------------------------------------------"

docker rmi test-image
