cd eureka
mvn spring-boot:run -Dserver.port=8761 -Dspring.application.name=eureka  &
cd ../persons
mvn spring-boot:run -Dspring.profiles.active=local -Dserver.port=8080 -Dspring.application.name=persons &
cd ../accounts
mvn spring-boot:run -Dserver.port=8081 -Dspring.application.name=accounts  &
cd ..