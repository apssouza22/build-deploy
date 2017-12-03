# Build & deploy 

This is a Docker image containing everything you need to build Java projects and deploy Docker images on AWS ECS using Jenkins Pipeline

Video demonstrating how to use the project 

<a href="http://www.youtube.com/watch?feature=player_embedded&v=6LPDbgf5ssU" target="_blank"><img src="http://img.youtube.com/vi/6LPDbgf5ssU/0.jpg" 
alt="Build and deploy" width="240" height="180" border="10" /></a>

## How to use

* build the image `docker build -t build-deploy:latest -f Dockerfile .`

* run the container `docker run -it docker run -e "ECS_CLUSTER=cluster-test" -e "ACCESS_KEY=my_access_key" -e "SECRET_KEY=my_secret_key" -e "REGIAN=eu-west-1"  -p 8080:8080 -p 5000:5000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock build-deploy:latest`

* Test your commands inside the container `docker exec -it CONTAINER_ID bash` 

* Configure your job on Jenkins `localhost:8080`


## NOTE

This is a part of another open source project that I'm working on. A bootstrap project to work 
with Microservices using Spring cloud.  [here](https://github.com/apssouza22/java-microservice)

## Tips

* Install "Select suggested plugin" in order to build a quick continuous deploy

* To run the job by HTTP call `curl user:PASSWORD@localhost:8080/job/job-name/build?token=your-token`

* To get the build number `sh "echo ${BUILD_NUMBER}"`

* Jenkins login - admin - admin
