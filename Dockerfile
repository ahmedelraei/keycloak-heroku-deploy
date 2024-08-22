FROM jefftian/keycloak-runner

# https://www.keycloak.org/server/logging
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
CMD ["--http-port=${PORT}", "--db=postgres", "--db-url=jdbc:${DB_URL}", "--spi-phone-default-service=dummy", "--spi-phone-default-duplicate-phone=false", "--hostname-strict=false", "--proxy=edge", "--log-level=root:INFO"]

