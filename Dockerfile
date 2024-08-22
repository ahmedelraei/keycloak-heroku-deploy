FROM jefftian/keycloak-runner

# https://www.keycloak.org/server/logging
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
CMD ["--http-port=${PORT}", "--db-url-host=${DB_URL_HOST}", "--db-username=${DB_USERNAME}", "--db-password=${DB_PASSWORD}", "--db-url-database=${DB_URL_DATABASE}", "--spi-phone-default-service=dummy", "--spi-phone-default-duplicate-phone=false", "--hostname-strict=false", "--proxy=edge", "--log-level=root:INFO"]

