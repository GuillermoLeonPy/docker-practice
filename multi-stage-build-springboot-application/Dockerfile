FROM bitnami/git:2.43.1 as sources
WORKDIR /sources_dir
RUN git clone https://github.com/shabbirdwd53/Spring-Data-JPA-Tutorial.git
COPY application.properties Spring-Data-JPA-Tutorial/src/main/resources/application.properties
COPY pom.xml Spring-Data-JPA-Tutorial/pom.xml

FROM maven:3.8.6-openjdk-11-slim as build
WORKDIR /build_dir
COPY --from=sources /sources_dir/Spring-Data-JPA-Tutorial /build_dir
RUN mvn -Dmaven.test.skip=true -X clean package

FROM adoptopenjdk/openjdk11:x86_64-alpine-jre-11.0.22_7
WORKDIR /application
COPY --from=build /build_dir/target/*.jar /application
ADD environment-variables-settings.sh /application 
ADD environment-settings.sh /application
RUN chmod +x environment-variables-settings.sh && chmod +x environment-settings.sh && mkdir log
EXPOSE 8080
ENTRYPOINT ["sh","environment-settings.sh"]
CMD ["java","-jar","spring-data-jpa-tutorial-0.0.1-SNAPSHOT.jar"]


