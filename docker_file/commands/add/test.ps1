docker build -qt test-image .
docker run -d --name test-container test-image sleep 2

write-host "Result--------------------------------------"
docker exec -t test-container ls -la test
write-host "--------------------------------------------"

start-sleep -seconds 2

docker rm test-container
docker rmi test-image


