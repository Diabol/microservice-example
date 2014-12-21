microservice-example
====================

The build.sh does a mvn clean install and also builds the diabol/slim:ms1 docker image.

To run the image, do

```
docker run -p 127.0.0.1:8081:8080 diabol/slim:ms1
```

If you are using boot2docker, the docker-host vm must be configured to port-forward properly to port 8081 in this case.

To stop the image, do 'docker ps' to find the container-id, then 'docker stop container-id'.

## Heroku
You can deploy the app to the Heroku PaaS as well. It does not use the Dockerfile. Heroku reads the
Procfile. It includes config.yml in the start command which has the necessary config to set the port
according to Heroku standards. We configure dropwizard to expose the app under /app instead of
:8080/.