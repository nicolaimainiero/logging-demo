FROM adoptopenjdk:11-hotspot-bionic AS build
COPY ./ /opt/logging-demo/
WORKDIR /opt/logging-demo/
RUN ./mvnw -f /opt/logging-demo/pom.xml clean package

FROM adoptopenjdk:11-jre-hotspot-bionic
COPY --from=build /opt/logging-demo//target/logging-demo-0.0.1-SNAPSHOT.jar /opt/logging-demo.jar
ENTRYPOINT ["java","-jar","/opt/logging-demo.jar"]