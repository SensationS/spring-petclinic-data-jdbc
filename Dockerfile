FROM openjdk:8-jdk-alpine
RUN addgroup -g 2000 -S appgroup && adduser -u 1000 -G appgroup -S appuser
RUN mkdir /logs && chown appuser /logs
VOLUME /tmp
ARG JAR_FILE=/build/libs/*.jar
COPY ${JAR_FILE} /home/appuser/app.jar
USER appuser
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/home/appuser/app.jar"]
