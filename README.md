# docker-kkmserver

[KkmServer](https://kkmserver.ru/) в контейнере Docker.

Запуск:

```bash
docker run --name kkmserver \
  --detach \
  --tty \
  --volume /etc/localtime:/etc/localtime:ro \
  --publish 5893:5893 \
  alexanderfefelov/kkmserver
```
