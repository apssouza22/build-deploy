# Build & deploy 

`docker build -t build-deploy:latest -f Dockerfile .`

`docker run -it -p 8080:8080 -p 5000:5000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock visionnet/build_machine:latest`

## Jenkins login

admin
5834

Install "Select suggested plugin"


## Start a job

`curl user:PASSWORD@localhost:8080/job/reminder-deploy/build?token=reminder-deploy`
