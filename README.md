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

При использовании кассового аппарата, подключенного через USB-порт, необходимо "прокинуть"
в контейнер соответствующее устройство, например, так:

```bash
docker run --name kkmserver \
  --detach \
  --tty \
  --device /dev/ttyACM0:/dev/ttyACM0 \
  --volume /etc/localtime:/etc/localtime:ro \
  --volume kkmserver:/opt/kkmserver/Settings \
  --publish 5893:5893 \
  alexanderfefelov/kkmserver
```
Узнать имя устройства можно с помощью команды `dmesg`:

```
...
[604961.208270] usb 7-1: new full-speed USB device number 3 using uhci_hcd
[604961.414710] usb 7-1: New USB device found, idVendor=2912, idProduct=0001
[604961.414717] usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[604961.414721] usb 7-1: Product: FPrint VCOM.
[604961.414724] usb 7-1: Manufacturer: ATOL Group.
[604961.414727] usb 7-1: SerialNumber: 00473561
[604962.099082] cdc_acm 7-1:1.0: ttyACM0: USB ACM device
[604962.102565] usbcore: registered new interface driver cdc_acm
[604962.102568] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
...
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
