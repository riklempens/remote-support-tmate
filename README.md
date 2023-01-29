# remotesupport

This container adds remote support to InfraSonar deployments using docker and [tmate](https://tmate.io/)

## Deploy

Just add the following section to our `docker-compose.yml` file, don'f forget to use a unique tmateName!
We suggest using the agentcore id.

```yaml
  remotesupport:
    << : *infrasonar
    image: ghcr.io/infrasonar/remotesupport
    environment:
      tmateName: "name-used-to connect-to"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /:/host/
```

you can verify the container is running as should by examing the log files:

```
docker logs infrasonar-remotesupport-1
To connect to the session locally, run: tmate -S /tmp/tmate-0/71noZS attach
Using /root/.ssh/authorized_keys for access control
Connecting to ssh.tmate.io...
ssh session read only: ssh ro-dptHztxwxUJdjUfNrpudp7N8C@lon1.tmate.io
ssh session: ssh infrasonar/rockhoppertje@lon1.tmate.io
```

## Tips and tricks

### Access host file system

The host file system is mounted under: `/host`

### Reboot the host

You can reboot the host from with the docker container:

```
echo b > /host/proc/sysrq-trigger
```
