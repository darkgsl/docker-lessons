* Когда лучше использовать CMD, а когда — связку ENTRYPOINT + CMD?
Если нужна гибкость при запуске контейнера (например: ENTRYPOINT [ping] + CMD [8.8.8.8]), т.е. нужна возможность переопределять аргументы, то используем связку ENTRYPOINT + CMD.
В остальных случаях исходим из простоты, использум только CMD.

* Можно ли использовать ARG в FROM? 
-да. это позволит нам менять поведение при сборке не внося изменения в сам Dockerfile
ARG NGINX_FROM_IMAGE=nginx:mainline
FROM ${NGINX_FROM_IMAGE} AS builder
https://github.com/nginx/docker-nginx/blob/5a4ad48c733b365d69a4d1c9946a9d8480469c7f/modules/Dockerfile

Пересоберется весь image.


* Чем shell-форма CMD echo $(date) принципиально отличается от exec-формы CMD ["echo","$(date)"]?
CMD echo $(date) -  выведет дату. на момент запуска контейнера
CMD ["echo","$(date)"] выведет "$(date)".
CMD ["bash", "-c","echo $(date)"] -> bash -c "echo $(date)" -> выведет дату. Это exec форма с использованием возможностей шелл, но PID 1 будет у bash а не запущенного процесса


CMD echo $(date) 
- используем когда нужно поведение shell
- CMD echo $(date)  выполняется через /bin/sh -c 
- PID контейнера =/bin/sh (PID 1),  echo дочерний процесс
- signal SIGTERM не приходит напрямую в echo
- поддерживает $(date), env, && и т.д.

