# docker-kkmserver

## Что это?

docker-kkmserver -- это сервер печати чеков/этикеток [KkmServer](https://kkmserver.ru/) в контейнере Docker.

## Как это запустить?

Для запуска контейнера выполните команду:

```bash
docker run --name kkmserver \
  --detach \
  --tty \
  --volume /etc/localtime:/etc/localtime:ro \
  --volume kkmserver:/opt/kkmserver/Settings \
  --publish 5893:5893 \
  alexanderfefelov/kkmserver
```

## Как остановить/запустить/перезапустить контейнер?

Для управления контейнером используйте команды:

    docker stop kkmserver
    docker start kkmserver
    docker restart kkmserver

## Как это удалить?

Удалите контейнер:

    docker rm -f kkmserver

Удалите образ:

    docker rmi alexanderfefelov/kkmserver

:fire: Удалите данные (настройки и логи):

    docker volume rm kkmserver
