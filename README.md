microservice-example
====================

The build.sh does a mvn clean install and also builds the diabol/slim:ms1 docker image.

To run the image, do

```
docker run -p 127.0.0.1:8081:8080 diabol/slim:ms1
```

If you are using boot2docker, the docker-host vm must be configured to port-forward properly to port 8081 in this case.

To stop the image, do 'docker ps' to find the container-id, then 'docker stop container-id'.

