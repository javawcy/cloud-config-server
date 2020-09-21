echo "====config server====="

mvn clean install -Dmaven.test.skip=true

docker build -f docker/dev.Dockerfile -t config-server:latest .
docker rm -f $(docker ps -a | grep 'config-server1' | awk '{print$1}')

docker run -d -p 9881:8080 --name config-server1 --hostname config-server1 --network cloud-demo config-server:latest