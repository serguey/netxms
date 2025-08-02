# NetXMS complete docker container
Docker container based Debian 12 with [netxms-server, netxms-agent and netxms-webui](https://netxms.com), controlled by [supervisord](https://supervisord.org)

### Running
With light webui:
```
docker run --rm -it -p 8080:8080 -p 4700:4700/tcp -p 514:514/udp -p 162:162/udp --name netxms -v /etc/netxms:/etc/netxms -v /opt/netxmsdb:/opt/netxmsdb -v /var/lib/netxms:/var/lib/netxms yaserguey/netxms:5.2.4
```

With classic webui:
```
docker run --rm -it -p 8080:8080 -p 4700:4700/tcp -p 514:514/udp -p 162:162/udp --name netxms -v /etc/netxms:/etc/netxms -v /opt/netxmsdb:/opt/netxmsdb -v /var/lib/netxms:/var/lib/netxms yaserguey/netxms:5.2.4-classic
```

### Building
To build run `./build.sh` or `./build.sh Dockerfile-classic`
