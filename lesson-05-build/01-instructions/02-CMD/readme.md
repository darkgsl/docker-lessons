# Task 02

## Goal
Understand CMD shell vs exec forms

## Steps
1. Create Dockerfile with CMD SHELL
```bash
CMD echo -e "Время: $(date) \nВечер в хату, господа арестанты! (с)"
```
2. Build image and run container
```bash
docker build -t echo:v1 .
docker run --rm --name echo_test echo:v1
```
3. Compare SHELL vs EXEC
```bash
CMD ["echo", "Время $(date)"]
```
## Result
Compared CMD shell vs exec forms and their behavior

- exec form предпочтительнее для production (корректная работа PID 1)
- exec form → сигнал SIGTERM приходит напрямую в процесс (важно для graceful shutdown)

- shell form → выполняется через /bin/sh -c
- exec form → НЕ использует shell
- поэтому exec НЕ поддерживает $(date), $VAR, && и т.д.
