#!/usr/bin/env bash
#cf login -a https://api.run.pivotal.io
# create
cf create-service p-service-registry standard eureka
cf create-service p-config-server standard config-service  -c '{"git": {"uri": "https://github.com/luismoramedina/config-repo"}, "count": 1}'

cf push

# All this stuff is replaced with manifest

#cd accounts
#cf push microaccounts -b https://github.com/cloudfoundry/java-buildpack.git -p target/*.jar --no-start
#cd ../persons
#cf push micropersons -b https://github.com/cloudfoundry/java-buildpack.git -p target/*.jar --no-start
# wait for service creation...
#cf bind-service micropersons eureka
#cf bind-service microaccounts eureka
#cf bind-service micropersons config-service
#cf bind-service microaccounts config-service
#cf set-env micropersons SPRING_APPLICATION_NAME persons
#cf set-env microaccounts SPRING_APPLICATION_NAME accounts
#cf set-env micropersons SPRING_PROFILES_ACTIVE default
#cf set-env microaccounts SPRING_PROFILES_ACTIVE default
#cf set-env micropersons SPRING_CLOUD_CONFIG_LABEL master
#cf start micropersons
#cf start microaccounts
