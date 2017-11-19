FROM jenkins/jenkins:lts
USER root
ENV REFRESHED_AT 2016-10-17


# Install curl, wget
RUN apt-get update -qq \
  && apt-get install -qqy curl wget \
  && apt-get clean

# Install AWS cli
RUN apt-get install python && \
    curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

# install AWS ECS cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
    chmod +x /usr/local/bin/ecs-cli

#AWS config
ADD ./aws/config_aws  /root/.aws/config
ADD ./aws/config_ecs  /root/.ecs/config
ADD ./aws/credentials  /root/.aws/credentials

#Install docker 
RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce

#Install maven
RUN apt-get -y install maven

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT [ "/usr/local/bin/start.sh" ]

