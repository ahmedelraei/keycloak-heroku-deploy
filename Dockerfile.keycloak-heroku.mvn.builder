FROM docker.io/maven:3.8.7-openjdk-18 as mvn_builder

ARG MAVEN_OPTS="-Xmx2048m"
ENV MAVEN_OPTS=$MAVEN_OPTS

VOLUME /root/.m2
RUN mkdir -p /root/.m2
COPY settings.xml /root/.m2/settings.xml

RUN mkdir -p /opt/keycloak
COPY . /opt/keycloak
RUN cd /opt/keycloak && MAVEN_OPTS=$MAVEN_OPTS mvn clean install -s /root/.m2/settings.xml

RUN ls -l /opt/keycloak/target
