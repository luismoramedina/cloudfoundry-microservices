#!/usr/bin/env bash
#cf login -a https://api.run.pivotal.io
cf create-service p-service-registry standard eureka
cd persons
cf push micropersons -b https://github.com/cloudfoundry/java-buildpack.git -p target/*.jar
cd accounts
cf push microaccounts -b https://github.com/cloudfoundry/java-buildpack.git -p target/*.jar
cf set-env micropersons SPRING_APPLICATION_NAME persons
cf set-env microaccounts SPRING_APPLICATION_NAME accounts
