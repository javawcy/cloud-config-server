version=$1

echo "====config server====="

mvn clean install -Dmaven.test.skip=true

docker build -f docker/dev.Dockerfile -t 192.168.10.124:8889/public/config-server:"${version}" .
docker push 192.168.10.124:8889/public/config-server:"${version}"
docker rmi -f 192.168.10.124:8889/public/config-server:"${version}"

#docker run -d -p 9881:8080 --name config-server1 --hostname config-server1 --network cloud-demo 192.168.10.124:8889/public/config-server:latest