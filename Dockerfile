ARG KEYCLOAK_VERSION=22.0.5

FROM docker.io/maven:3.8.7-openjdk-18 AS mvn_builder

ARG MAVEN_OPTS="-Xmx2048m"
ENV MAVEN_OPTS=$MAVEN_OPTS

VOLUME /root/.m2
RUN mkdir -p /root/.m2
COPY settings.xml /root/.m2/settings.xml

RUN mkdir -p /opt/keycloak
COPY . /opt/keycloak
RUN cd /opt/keycloak && MAVEN_OPTS=$MAVEN_OPTS mvn clean install -s /root/.m2/settings.xml

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} AS builder
COPY --from=mvn_builder /opt/keycloak/target/*.jar /opt/keycloak/providers/
COPY --from=mvn_builder /opt/keycloak/target/*.jar /opt/keycloak/deployments/

ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true

USER 1000

ENV JAVA_OPTS="-Xmx2g -Xms512m"

RUN /opt/keycloak/bin/kc.sh build --db=postgres --health-enabled=true

FROM quay.io/keycloak/keycloak:$KEYCLOAK_VERSION
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

ENV KC_PROXY_ADDRESS_FORWARDING=true

# https://www.keycloak.org/server/logging
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
CMD ["--http-port=${PORT}", "--db-url-host=${DB_URL}", "--db-username=${DB_USERNAME}", "--db-password=${DB_PASSWORD}", "--spi-phone-default-service=dummy", "--spi-phone-default-duplicate-phone=false", "--hostname-strict=false", "--proxy=edge", "--log-level=root:INFO"]

