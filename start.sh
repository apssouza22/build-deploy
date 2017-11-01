#!/bin/bash

sed -i -e 's/@ECS_CLUSTER@/'$ECS_CLUSTER'/g' /root/.ecs/config
sed -i -e 's/@ACCESS_KEY@/'$ACCESS_KEY'/g' /root/.ecs/config
sed -i -e 's/@SECRET_KEY@/'$SECRET_KEY'/g' /root/.ecs/config
sed -i -e 's/@REGIAN@/'$REGIAN'/g' /root/.ecs/config

sed -i -e 's/@ACCESS_KEY@/'$ACCESS_KEY'/g' /root/.aws/credentials
sed -i -e 's/@SECRET_KEY@/'$SECRET_KEY'/g' /root/.aws/credentials

#Starting jenkins
./bin/tini -- /usr/local/bin/jenkins.sh
