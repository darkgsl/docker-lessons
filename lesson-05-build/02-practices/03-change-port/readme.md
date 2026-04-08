# Task 01

## Goal
меняем порт 80 не из под root
## Steps


## Result
apk update and --no-cache
бессысленно
Флаг --no-cache сам скачивает свежие индексы прямо в оперативную память и не сохраняет их на диск, экономя место
dp 80:8080 наружу -внутрь

...

docker buildx bake lesson5

docker run -dp 80:8080 --rm --name lsn5 lesson5:v1.3 

docker inspect lsn5 --format='{{json .State.Health}}'