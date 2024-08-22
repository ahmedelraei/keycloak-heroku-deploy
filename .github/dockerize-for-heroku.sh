docker build -f Dockerfile.runner -t jefftian/keycloak-runner:"$1" .
docker images
docker push jefftian/keycloak-runner:"$1"
