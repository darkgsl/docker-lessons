# Lesson 05: Docker Build

## 🎯 Цель
Понять базовую сборку Docker image

## 📌 Что изучил
- docker build создаёт image из Dockerfile
- тег (-t) обязателен для удобной работы
- image без тега = сложно использовать
- различия между shell и exec формами CMD
- exec не использует shell → нет $(...), &&, подстановок
- ENTRYPOINT vs CMD

## Tasks  
### 01-instructions
- 01-basic build
- 02-CMD
### 02-practices
- 01-

## 🧠 Ключевые выводы
- всегда указывай тег
- latest не использовать в проде
- shell form → выполняется через /bin/sh -c
- exec form → НЕ использует shell
- поэтому exec НЕ поддерживает $(date), $VAR, && и т.д.
## 🔥 Полезные команды
```bash
docker build -t neomaster/test:v1 .
docker images
```
## 📎 Заметки
- image без тега неудобен (сложно ссылаться)
- exec form → запускаемый процесс становится PID 1 (без shell)





## 📌 Что изучил

- Что такое контейнер и чем он отличается от VM
- Как работает docker run
- Что происходит при запуске контейнера (namespaces, cgroups)
- Разница между image и container

## 🎯 Цель

Понять базовую модель работы Docker и научиться запускать контейнеры.

## 🧪 Практика

- Task 01: запуск контейнера и работа с процессами
- Task 02: интерактивный режим и exec

## 🧠 Ключевые выводы

- Контейнер — это изолированный процесс
- docker run скрывает сложную работу с namespaces и cgroups
- контейнер живёт, пока живёт его PID 1

## 🔥 Полезные команды

```bash
docker run -it alpine /bin/sh
docker ps
docker exec -it <container> /bin/sh


- 01: basic build
- 02: cache optimization
- 03: buildx
- 04: bake

lesson-05-build/

  01-basic/
  02-layer-cache/
  03-multi-stage/
  04-buildx/
  05-bake/


## Tasks  
- 01: basic build image



- tsk-02: exec into container  
- tsk-03: detached mode
	- Плохо - tsk-01: запуск контейнера alpine с флагами -it...
	  хорошо - tsk-01: run alpine

## 📎 Заметки

- PID 1 плохо обрабатывает сигналы
- zombie процессы нужно учитывать
- docker run создаёт namespaces и cgroups
