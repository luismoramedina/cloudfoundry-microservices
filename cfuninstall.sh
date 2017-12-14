#!/usr/bin/env bash
#cf login -a https://api.run.pivotal.io

#delete
cf unbind-service micropersons config-service
cf unbind-service microaccounts config-service
cf unbind-service microaccounts eureka
cf unbind-service micropersons eureka
cf delete micropersons -f
cf delete microaccounts -f