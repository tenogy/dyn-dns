# Tenogy.Dns
Description
## Quick start

1. Build the app `docker build --no-cache -t tenogy/dns:1.0.1 --build-arg VERSION=3.1.201-alpine3.11 -f devops/Dockerfile .`
2. run `docker-compose -f devops/docker-compose.yml up -d`
3. check 'curl http://localhost:8080/health'