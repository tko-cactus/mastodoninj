FROM gradle:7-jdk17-jammy AS builder
ENV APP_HOME=/work
WORKDIR $APP_HOME
COPY ./src ./src
COPY ./build.gradle .
RUN gradle build
RUN ls -l

FROM eclipse-temurin:17-jre-ubi9-minimal AS runner
ENV APP_HOME=/work
ENV ARTIFACT_NAME=mastodoninj-0.0.1-SNAPSHOT.jar
WORKDIR $APP_HOME
RUN mkdir -p /app
COPY --from=builder $APP_HOME/build/libs/*.jar /app/mastodoninj-1.0.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/mastodoninj-1.0.jar"]