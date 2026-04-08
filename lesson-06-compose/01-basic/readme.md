# Task 01

## Goal
создаем Yml для build и run контейнера
## Steps


## Result
-.env всегда создавай
- compose читает автоматически в отличии от docker q
- как и в bake, можно прописывать разные директории с dockerfile
- можно build, а можно image  уазать для запуска
- если build, То указываем все нужные параметры

можно собрать образ , но не запустить
docker compose build
можно запустить и пересобрать
docker compose up --build
ну а тут понятно
docker compose build --no-cache 
можно указывать зависимости
а можно просто up and down. image соберется если его нет и удалится контейнер после down



...

docker buildx bake lesson5

docker run -dp 80:8080 --rm --name lsn5 lesson5:v1.3 

docker inspect lsn5 --format='{{json .State.Health}}'