# Task 01

## Goal
добавляем health and bake for build

## Steps
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1
-interval=10s	Интервал между проверками (Docker будет запускать проверку каждые 10 секунд (по умолчанию 30s).)
--timeout=3s	Тайм-аут выполнения команды (Если команда выполняется дольше 3 секунд, проверка считается проваленной.)
--start-period=10s	Период запуска	В течение первых 10 секунд после старта контейнера провалы проверки не учитываются в счётчик --retries. Это даёт приложению время инициализироваться.
--retries=3	Количество последовательных провалов	Если 3 проверки подряд завершились неудачно, контейнер помечается как unhealthy.


## Result
...

docker buildx bake lesson5

docker run -dp 8080:8080 --rm --name lsn5 lesson5:v1.1 

docker inspect lsn5 --format='{{json .State.Health}}'