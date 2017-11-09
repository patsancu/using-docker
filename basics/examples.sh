#!/usr/bin/env bash

# run redis detached container, tag it with name "myredis"
docker run --name myredis -d redis

# creates another instance of redis, links it to container named "myredis", lets this
# new container refer to it as redis,
# launches redis-cli
docker run --rm -it --link myredis:redis --name redis-cli redis /bin/bash


# assuming myredis is running
docker run --rm -it --link myredis:redis redis /bin/bash
root@09a1c4abf81f:/data# redis-cli -h redis -p 6379
redis:6379> set "persistence" "test"
OK
redis:6379> save
OK
redis:6379> exit
root@09a1c4abf81f:/data# exit exit

# Mount container's backup folder to $(pwd)/backup and copy
# (inside debian "guest") file /data/dump.rdb (file created from
# the save redis command in last redis container)
# to the guest folder /data and host $(pwd)/data folder
docker run --rm --volumes-from myredis -v $(pwd)/backup:/backup debian cp /data/dump.rdb /backup/
