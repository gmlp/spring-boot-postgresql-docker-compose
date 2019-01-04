# Spring Boot app & Postgresql & Docker compose

## 1. Build app & Docker Image

```bash
docker build -t gmlpdou/spring-boot-postgresql:latest .
```

## 2. Run docker-compose

```bash
docker-compose up
```

**What happens:**

1. Starts Postgresql and waits up to 15 seconds for it to finish ([using wait-for-it](https://github.com/vishnubob/wait-for-it))
2. Starts Spring boot application which populates database with some test data

## 3. Test

Navigate to <http://localhost:8080> and you should see: `[{"id":1,"name":"A"},{"id":2,"name":"B"},{"id":3,"name":"C"}]`
